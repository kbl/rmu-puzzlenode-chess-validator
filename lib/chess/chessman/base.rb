module Chess
  module Chessman
    class Base

      HORIZONTAL_AXIS = %w[a b c d e f g h]
      ZERO_BASED = 1

      attr_reader :x, :y

      def initialize(position)
        p position[0].downcase
        @x = HORIZONTAL_AXIS.index(position[0].downcase) + ZERO_BASED
        @y = position[1].to_i
      end

    end
  end
end
