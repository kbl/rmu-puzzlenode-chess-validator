require 'chess/chessman/base'

module Chess
  module Chessman
    class Knight < Base

      MOVES_VECTORS = [[-1, -2], [ 1, -2],
                       [-2, -1], [ 2, -1],
                       [-2,  1], [ 2,  1],
                       [-1,  2], [ 1,  2]]

      def initialize(position, color)
        super
        initialize_validator
        initialize_possible_moves
      end

      def to_s
        "N#{@field}"
      end

      private

      def initialize_validator
        @validator = Validator.new do |board, cords|
          chessman = board[*cords]
          !chessman || chessman.color != @color
        end
      end

      def initialize_possible_moves
        @possible_moves = []

        MOVES_VECTORS.each do |vector|
          cords = cords_from_vector(*vector)
          @possible_moves << Move.new(cords, @validator) if cords
        end
      end

    end
  end
end
