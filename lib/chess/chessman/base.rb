module Chess
  module Chessman
    class Base

      HORIZONTAL_AXIS = %w[a b c d e f g h]
      ZERO_BASED = 1

      attr_reader :x, :y

      def initialize(position)
        pos = position.downcase
        raise 'illegal argument' unless pos =~ /^[abcdefgh][12345678]$/

        @x = HORIZONTAL_AXIS.index(pos[0]) + ZERO_BASED
        @y = pos[1].to_i
      end

    end
  end
end
