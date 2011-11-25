require 'chess/chessman/base'

module Chess
  module Chessman
    class Pawn < Base

      UPWARDS = 1
      DOWNWARDS = -1

      FIRST_LINE_WHITE = 2
      FIRST_LINE_BLACK = 7
      
      def initialize(position, color)
        super
        initialize_validators
        initialize_possible_moves
      end

      def each
        @possible_moves.each { |m| yield m }
      end

      private

      def first_line?
        if white?
          @y == FIRST_LINE_WHITE
        else
          @y == FIRST_LINE_BLACK
        end
      end

      def initialize_possible_moves
        @possible_moves = []

        white = [[0, 1], [0, 2]]
        white_capturing = [[-1, 1], [1, 1]]

        black = [[0, -1], [0, -2]]
        black_capturing = [[-1, -1], [1, -1]]

        if white?
          vectors = white
          vectors_capturing = white_capturing
        else
          vectors = black;
          vectors_capturing = black_capturing
        end

        sequence = MoveSequence.new
        vectors.each do |vector|
          cords = cords_from_vector(*vector)
          break unless cords
          sequence << Move.new(cords, @empty_field_validator)
        end
        @possible_moves << sequence

        white_capturing.each do |vector|
          cord = cords_from_vector(*vector)
          @possible_moves << Move.new(cord, @capturing_validator) if cord
        end
      end

      def initialize_validators
        @capturing_validator = Validator.new do |chessman|
          chessman && chessman.color != color
        end                                

        @first_line_validator = Validator.new do |chessman|
          first_line? && !chessman
        end

        @empty_field_validator = Validator.new do |chessman|
          !chessman
        end
      end

    end
  end
end
