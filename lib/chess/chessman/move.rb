module Chess
  module Chessman
    class Move
      def initialize(vector_x, vector_y, &validation)
        @move_vector, @validation = [vector_x, vector_y], validation
      end

      def valid?(chessman, board)
        @chessman, @board = chessman, board
        @move_cords = [chessman.x + @move_vector[0], chessman.y + @move_vector[1]]

        if Base.valid_cords?(*@move_cords)
          call_validation
        end
      end

      private 

      def call_validation
        if @validation
          @move_cords if @validation.call(@chessman, @board, @move_cords)
        else
          @move_cords
        end
      end
    end
  end
end
