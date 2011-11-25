module Chess
  module Chessman
    module Movement
      class Validator

        def initialize(chessman, &validation_block)
          @chessman, @validation_block = chessman, validation_block
        end

        def valid?(board, cords)
          @validation_block.call(@chessman, board[*cords])
        end

      end
    end
  end
end
