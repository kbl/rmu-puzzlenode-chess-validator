module Chess
  module Chessman
    module Movement
      class Move
        
        attr_reader :cords

        def initialize(vector_x, vector_y, validator = Validator.no_op)
          @move_vector, @validator = [vector_x, vector_y], validator
        end

        def valid_cords(chessman, board)
          @chessman, @board = chessman, board
          @cords = [chessman.x + @move_vector[0], chessman.y + @move_vector[1]]

          call_validation if Base.valid_cords?(*@cords)
        end

        private 

        def call_validation
          [@cords] if @validator.valid?(@chessman, @board, @cords)
        end
      end
    end
  end
end
