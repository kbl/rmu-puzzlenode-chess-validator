module Chess
  module Chessman
    class Move
      def initialize(vector_x, vector_y, &validation)
        @move, @validation = [vector_x, vector_y], validation
      end

      def valid?(chessman, board)
        # non-thread safety!
        @chessman, @board = chessman, board
        @x, @y = chessman.x + @move[0], chessman.y + @move[1]

        valid_cords = Base.valid_cords?(@x, @y)

        if valid_cords
          call_validation
        end
      end

      private 

      def position_on_board_occupied?
        chessman_on_board = @board[@x, @y]
        chessman_on_board && chessman_on_board.color == @chessman.color
      end

      def call_validation
        if @validation
          [@x, @y] if @validation.call(@chessman, @x, @y)
        else
          [@x, @y]
        end
      end
    end
  end
end
