require 'chess/chessman/base'

module Chess
  module Chessman

    module RooklikeMovement

      include Movement

      def apply_rooklike_movement
        MoveSequence::SEQUENCES.each do |vector_sequence|
          sequence_row = MoveSequence.new
          sequence_column = MoveSequence.new

          vector_sequence.each do |vector|
            cords_row = cords_from_vector(vector, 0)
            cords_column = cords_from_vector(0, vector)

            sequence_row << Move.new(cords_row, @validator, :braking) if cords_row
            sequence_column << Move.new(cords_column, @validator, :braking) if cords_column
          end

          @possible_moves << sequence_row unless sequence_row.empty?
          @possible_moves << sequence_column unless sequence_column.empty?
        end
      end
    end

    class Rook < Base
      def initialize(position, color)
        super
        initialize_possible_moves
      end

      def to_s
        "R#{@field}"
      end

      private

      include RooklikeMovement

      def initialize_possible_moves
        @validator = Validator.new_sequence_validator(@color)
        @possible_moves = []

        apply_rooklike_movement
      end
    end

  end
end
