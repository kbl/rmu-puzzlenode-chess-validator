module Chess
  module Chessman
    module Movement
      class Move
        
        attr_reader :cords

        def initialize(cords, validator = Validator.no_op)
          @cords, @validator = cords, validator
        end

        def valid?(board)
          @validator.valid?(board, @cords)
        end

      end
    end
  end
end
