module Chess
  module Chessman
    class Move
      def initialize(move, color, &validation)
        @move, @color, @validation = move, color, validation
      end

      def self.white(vector_x, vector_y, &validation)
        Move.new([vector_x, vector_y], :white, &validation)
      end
      def self.black(vector_x, vector_y, &validation)
        Move.new([vector_x, vector_y], :black, &validation)
      end

      def valid?(chessman)
        # non-thread safety!
        @chessman = chessman
        @x, @y = chessman.x + @move[0], chessman.y + @move[1]

        valid_cords = Base.valid_cords?(@x, @y)
        valid_color = chessman.color == @color 
        
        if valid_cords && valid_color
          call_validation
        end
      end

      private 

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
