module Chess
  module Chessman
    class Base

      HORIZONTAL_AXIS = %w[a b c d e f g h]
      COLORS = [:black, :white]
      POSITIONS = 1..8
      ZERO_BASED = 1

      attr_reader :x, :y, :color

      def initialize(position, color)
        pos = position.downcase
        raise 'illegal position argument' unless pos =~ /^[abcdefgh][12345678]$/
        raise 'illegal color argument' unless COLORS.include?(color)

        @color = color
        @x = HORIZONTAL_AXIS.index(pos[0]) + ZERO_BASED
        @y = pos[1].to_i
      end

      def self.position(x, y)
        [x, y].each { |cord| raise 'illegal argument' unless POSITIONS.include?(cord) }

        "#{HORIZONTAL_AXIS[x - ZERO_BASED]}#{y}"
      end

    end
  end
end
