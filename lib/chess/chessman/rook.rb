require 'chess/chessman/base'

module Chess
  module Chessman

    module RooklikeMovement

      include Movement

      def apply_rooklike_movement
        MoveSequence::SEQUENCES.each do |vector_sequence|
          sequence_row = MoveSequence.new
          sequence_row_capturing = MoveSequence.new

          sequence_column = MoveSequence.new
          sequence_column_capturing = MoveSequence.new

          vector_sequence.each do |vector|
            cords_row = cords_from_vector(vector, 0)
            cords_column = cords_from_vector(0, vector)

            if cords_row
              sequence_row << Move.new(cords_row, @validator, :braking)
              sequence_row_capturing << Move.new(cords_row, @capturing_validator, :braking)
            end
            if cords_column
              sequence_column << Move.new(cords_column, @validator, :braking)
              sequence_column_capturing << Move.new(cords_column, @capturing_validator, :braking)
            end
          end

          [sequence_row, sequence_column].each { |s| @possible_moves << s unless s.empty? }
          [sequence_row_capturing, sequence_column_capturing].each { |s| @capturing_moves << s unless s.empty? }
        end
      end
    end

    class Rook < Base
      def initialize(position, color)
        super
        initialize_validators
        initialize_possible_moves
      end

      def to_s
        "R#{@field}"
      end

      private

      include RooklikeMovement

      def initialize_validators
        @validator = Validator.sequence_validator(@color)
        @capturing_validator = Validator.sequence_capturing_validator
      end

      def initialize_possible_moves
        @possible_moves = []
        @capturing_moves = []

        apply_rooklike_movement
      end
    end

  end
end
