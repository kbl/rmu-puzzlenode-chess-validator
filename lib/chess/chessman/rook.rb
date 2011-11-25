require 'chess/chessman/base'

module Chess
  module Chessman
    class Rook < Base

      def initialize(position, color)
        super
        initialize_validator
        initialize_possible_moves
      end

      private

      def initialize_possible_moves
        @possible_moves = []
          
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

      def initialize_validator
        @validator = Validator.new do |chessman, move|
          if !chessman
            true
          else
            could_be_captured = chessman.color != color
            move.stop_sequence! if could_be_captured
          
            could_be_captured
          end
        end
      end

    end
  end
end
