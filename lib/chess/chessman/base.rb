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


      def self.field(x, y)
        raise 'illegal argument' unless valid_cords?(x, y)
        "#{HORIZONTAL_AXIS[x - ZERO_BASED]}#{y}"
      end

      def self.valid_cords?(x, y)
        [x, y].each { |cord| return false unless POSITIONS.include?(cord) }
        true
      end

      def self.cords(position)
        pos = position.downcase
        raise 'illegal position argument' unless pos =~ /^[abcdefgh][12345678]$/

        [HORIZONTAL_AXIS.index(pos[0]) + ZERO_BASED, pos[1].to_i]
      end

      protected

      def fields_from_cords(cords)
        fields = [] 
        cords.reject(&:nil?).each do |cord|
          fields << Base.field(*cord)
        end
        fields
      end

    end
  end
end
