module Chess
  module Chessman
    class Base

      HORIZONTAL_AXIS = %w[a b c d e f g h]
      COLORS = [:black, :white]
      POSITIONS = 1..8
      ZERO_BASED = 1

      FIRST_LINE_WHITE = 2
      FIRST_LINE_BLACK = 7

      attr_reader :x, :y, :color

      def initialize(position, color)
        @x, @y = Base.cords(position)

        raise 'illegal color argument' unless COLORS.include?(color)
        @color = color
      end


      def self.position(x, y)
        validate_position(x, y)
        "#{HORIZONTAL_AXIS[x - ZERO_BASED]}#{y}"
      end

      def self.validate_position(x, y)
        [x, y].each { |cord| raise 'illegal argument' unless POSITIONS.include?(cord) }
      end

      def self.cords(position)
        pos = position.downcase
        raise 'illegal position argument' unless pos =~ /^[abcdefgh][12345678]$/

        [HORIZONTAL_AXIS.index(pos[0]) + ZERO_BASED, pos[1].to_i]
      end

      protected

      def moves_from_positions(cords)
        moves = []
        cords.each do |cord|
          begin
            moves << Base.position(x + cord[0], y + cord[1])
          rescue
          end
        end
        
        moves
      end

    end
  end
end
