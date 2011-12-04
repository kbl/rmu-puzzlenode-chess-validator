module Chess
  module Chessman
    module Movement
      class Validator

        class << self
          def no_op_validator
            Validator.new do |board, cords, move|
              true
            end
          end

          def sequence_validator(color)
            Validator.new do |board, cords, move|
              chessman = board[*cords]
              if !chessman
                true
              else
                could_be_captured = chessman.color != color
                move.stop_sequence! if could_be_captured
              
                could_be_captured
              end
            end
          end
          def sequence_capturing_validator
            Validator.new do |board, cords, move|
              chessman = board[*cords]
              if chessman
                move.stop_sequence!
              end
              true
            end
          end
        end

        def initialize(&validation_block)
          @validation_block = validation_block
        end

        def valid?(board, cords, move = nil)
          if move
            @validation_block.call(board, cords, move)
          else
            @validation_block.call(board, cords)
          end
        end

      end
    end
  end
end
