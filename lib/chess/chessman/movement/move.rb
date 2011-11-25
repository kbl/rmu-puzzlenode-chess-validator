module Chess
  module Chessman
    module Movement
      class Move
        
        attr_reader :cords

        def initialize(vector_x, vector_y, &validation)
          @move_vector, @validation = [vector_x, vector_y], validation
        end

        def valid_cords(chessman, board)
          @chessman, @board = chessman, board
          @cords = [chessman.x + @move_vector[0], chessman.y + @move_vector[1]]

          call_validation if Base.valid_cords?(*@cords)
        end

        private 

        def call_validation
          if @validation
            [@cords] if @validation.call(@chessman, @board, @cords)
          else
            [@cords]
          end
        end
      end
    end
  end
end
