require 'chess/chessman/base'

module Chess
  module Chessman
    class Queen < Base

      def initialize(position, color)
        super
        initialize_possible_moves
      end

      def to_s
        "Q#{@field}"
      end

      private

      include BishoplikeMovement, RooklikeMovement

      def initialize_possible_moves
        @validator = Validator.new_sequence_validator(@color)
        @possible_moves = []

        apply_bishoplike_movement
        apply_rooklike_movement
      end

    end
  end
end
