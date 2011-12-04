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

      attr_reader :x, :y, :color, :field

      class << self
        def white(*args)
          new(*args, :white)
        end
        def black(*args)
          new(*args, :black)
        end

        def field(x, y)
          raise "illegal argument #{x}, #{y}" unless valid_cords?(x, y)
          "#{HORIZONTAL_AXIS[x - ZERO_BASED]}#{y}"
        end

        def valid_cords?(x, y)
          [x, y].each { |cord| return false unless POSITIONS.include?(cord) }
          true
        end

        def cords(field)
          fi = field.downcase
          raise "illegal field argument #{fi}" unless fi =~ /^[abcdefgh][12345678]$/

          [HORIZONTAL_AXIS.index(fi[0]) + ZERO_BASED, fi[1].to_i]
        end
      end

      def initialize(field, color)
        @field = field
        @x, @y = Base.cords(field)

        raise "illegal color argument #{color}" unless COLORS.include?(color)
        @color = color
      end

      def moves(board)
        return @move_fields if @move_fields
        cords = prepare_valid_cords(@possible_moves, board)

        @move_fields = fields_from_cords(cords)
      end

      def capturing_moves(board)
        return @capturing_fields if @capturing_fields
        cords = prepare_valid_cords(@capturing_moves, board)

        @capturing_fields = fields_from_cords(cords)
      end

      def white?
        color == :white
      end

      def opposite_color
        white? ? :black : :white
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

      private

      def prepare_valid_cords(moves, board)
        cords = []
        moves.each do |move|
          cords << move.cords if move.valid?(board)
        end
        cords.flatten!(1)

        cords
      end

    end
  end
end
