require 'chess/chessman/base'
require 'chess/chessman/rook'

module Chess
  module Chessman
    class Bishop < Base

      def initialize(position, color)
        super
        initialize_possible_moves
      end

      private

      def initialize_possible_moves
        @validator = Validator.new_sequence_validator(@color)
        @possible_moves = []

        MoveSequence::SEQUENCES.each do |vector_sequence|
          sequence1 = MoveSequence.new
          sequence2 = MoveSequence.new

          vector_sequence.each do |vector|
            cords1 = cords_from_vector(vector, vector)
            cords2 = cords_from_vector(vector, -vector)

            sequence1 << Move.new(cords1, @validator, :breaking) if cords1
            sequence2 << Move.new(cords2, @validator, :breaking) if cords2
          end
          @possible_moves << sequence1 unless sequence1.empty?
          @possible_moves << sequence2 unless sequence2.empty?
        end
      end

    end
  end
end
