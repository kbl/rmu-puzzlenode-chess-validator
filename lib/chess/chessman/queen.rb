require 'chess/chessman/base'

module Chess
  module Chessman
    class Queen < Base

      def initialize(position, color)
        super
        initialize_validators
        initialize_possible_moves
      end

      def to_s
        "Q#{@field}"
      end

      private

      include BishoplikeMovement, RooklikeMovement

      def initialize_validators
        @validator = Validator.sequence_validator(@color)
        @capturing_validator = Validator.sequence_capturing_validator
      end

      def initialize_possible_moves
        @possible_moves = []
        @capturing_moves = []

        apply_bishoplike_movement
        apply_rooklike_movement
      end

    end
  end
end
