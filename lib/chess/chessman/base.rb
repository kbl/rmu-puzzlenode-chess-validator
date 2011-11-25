require 'chess/chessman/movement/move'
require 'chess/chessman/movement/move_sequence'
require 'chess/chessman/movement/validator'

module Chess
  module Chessman
    class Base

      include Movement

      HORIZONTAL_AXIS = %w[a b c d e f g h]
      COLORS = [:black, :white]
      POSITIONS = 1..8
      ZERO_BASED = 1

      attr_reader :x, :y, :color

      class << self
        def white(*args)
          new(*args, :white)
        end

        def black(*args)
          new(*args, :black)
        end
      end

      def initialize(position, color)
        @x, @y = Base.cords(position)

        raise "illegal color argument #{color}" unless COLORS.include?(color)
        @color = color
      end

      def moves(board)
        cords = []
        @possible_moves.each do |move|
          cords << move.cords if move.valid?(board)
        end
        cords.flatten!(1)

        fields_from_cords(cords)
      end

      def white?
        color == :white
      end

      def self.field(x, y)
        raise "illegal argument #{x}, #{y}" unless valid_cords?(x, y)
        "#{HORIZONTAL_AXIS[x - ZERO_BASED]}#{y}"
      end

      def self.valid_cords?(x, y)
        [x, y].each { |cord| return false unless POSITIONS.include?(cord) }
        true
      end

      def self.cords(field)
        fi = field.downcase
        raise "illegal field argument #{fi}" unless fi =~ /^[abcdefgh][12345678]$/

        [HORIZONTAL_AXIS.index(fi[0]) + ZERO_BASED, fi[1].to_i]
      end

      protected

      def fields_from_cords(cords)
        fields = [] 
        cords.reject(&:nil?).each do |cord|
          fields << Base.field(*cord)
        end
        fields
      end

      def cords_from_vector(x, y)
        cords = [@x + x, @y + y]
        cords if Base.valid_cords?(*cords)
      end

    end
  end
end
