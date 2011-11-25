module Chess
  module Chessman
    module Movement
      class Validator

        def self.new_sequence_validator(color)
          Validator.new do |chessman, move|
            if !chessman
              true
            else
              could_be_captured = chessman.color != color
              move.stop_sequence! if could_be_captured
            
              could_be_captured
            end
          end
        end

        def initialize(&validation_block)
          @validation_block = validation_block
        end

        def valid?(board, cords, sequence = nil)
          if sequence
            @validation_block.call(board[*cords], sequence)
          else
            @validation_block.call(board[*cords])
          end
        end

      end
    end
  end
end
