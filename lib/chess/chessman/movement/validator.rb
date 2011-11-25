module Chess
  module Chessman
    module Movement
      class Validator

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
