require 'chess/chessman/base'

module Chess
  module Chessman
    class Pawn < Base

      FIRST_LINE_WHITE = 2
      FIRST_LINE_BLACK = 7

      WHITE = [[0, 1], [0, 2]]
      WHITE_CAPTURING = [[-1, 1], [1, 1]]

      BLACK = [[0, -1], [0, -2]]
      BLACK_CAPTURING = [[-1, -1], [1, -1]]
      
      def initialize(position, color)
        super
        initialize_validators
        initialize_possible_moves
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

        vectors, vectors_capturing = BLACK, BLACK_CAPTURING
        if white?
          vectors, vectors_capturing = WHITE, WHITE_CAPTURING
        end

        sequence = MoveSequence.new
        vectors.each do |vector|
          cords = cords_from_vector(*vector)
          break unless cords
          sequence << Move.new(cords, @first_line_validator, :breaking)
        end
        @possible_moves << sequence

        vectors_capturing.each do |vector|
          cord = cords_from_vector(*vector)
          @possible_moves << Move.new(cord, @capturing_validator) if cord
        end
      end

      def initialize_validators
        @capturing_validator = Validator.new do |chessman|
          chessman && chessman.color != color
        end                                

        @first_line_validator = Validator.new do |field_occupied, move|
          unless first_line?
            move.stop_sequence!
          end

          !field_occupied
        end
      end

    end
  end
end
