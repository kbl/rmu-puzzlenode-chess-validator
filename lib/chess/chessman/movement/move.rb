module Chess
  module Chessman
    module Movement
      class Move
        
        def initialize(cords, validator = Validator.no_op)
          @cords, @validator = cords, validator
        end

        def valid?(board)
          @validator.valid?(board, @cords)
        end

        def to_s
          @cords
        end

        def cords
          [@cords]
        end

      end
    end
  end
end
