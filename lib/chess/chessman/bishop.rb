require 'chess/chessman/base'

module Chess
  module Chessman

    module BishoplikeMovement

      include Movement

      def apply_bishoplike_movement
        MoveSequence::SEQUENCES.each do |vector_sequence|
          sequence1 = MoveSequence.new
          sequence2 = MoveSequence.new

          sequence1_capturing = MoveSequence.new
          sequence2_capturing = MoveSequence.new

          vector_sequence.each do |vector|
            cords1 = cords_from_vector(vector, vector)
            cords2 = cords_from_vector(vector, -vector)

            if cords1
              sequence1 << Move.new(cords1, @validator, :breaking)
              sequence1_capturing << Move.new(cords1, @capturing_validator, :breaking)
            end
            if cords2
              sequence2 << Move.new(cords2, @validator, :breaking)
              sequence2_capturing << Move.new(cords2, @capturing_validator, :breaking)
            end
          end

          [sequence1, sequence2].each { |s| @possible_moves << s unless s.empty? }
          [sequence1_capturing, sequence2_capturing].each { |s| @capturing_moves << s unless s.empty? }
        end
      end
    end

    class Bishop < Base
      def initialize(position, color)
        super
        initialize_validators
        initialize_possible_moves
      end

      def to_s
        "B#{@field}"
      end

      private

      include BishoplikeMovement

      def initialize_validators
        @validator = Validator.sequence_validator(@color)
        @capturing_validator = Validator.sequence_capturing_validator
      end

      def initialize_possible_moves
        @possible_moves = []
        @capturing_moves = []

        apply_bishoplike_movement
      end
    end

  end
end
