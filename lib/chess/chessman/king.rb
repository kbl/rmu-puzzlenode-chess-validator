require 'chess/chessman/base'

module Chess
  module Chessman
    class King < Base

      MOVE_VECTORS = (-1..1).to_a.repeated_permutation(2).reject { |x, y| x == 0 && y == 0 }

      def initialize(position, color)
        super
        initialize_validator
        initialize_possible_moves
      end

      def to_s
        "K#{@field}"
      end

      private

      def initialize_validator
        @validator = Validator.new do |board, cords|
          checked_field = board.check?(@color, Base.field(*cords))
          
          chessman = board[*cords]
          different_chessman_color_or_empty_field = !chessman || chessman.color != @color

          !checked_field && different_chessman_color_or_empty_field
        end
      end

      def initialize_possible_moves
        @possible_moves = []
        @capturing_moves = []

        MOVE_VECTORS.each do |vector|
          cords = cords_from_vector(*vector)
          if cords
            @possible_moves << Move.new(cords, @validator)
            @capturing_moves << Move.new(cords)
          end
        end
      end

    end
  end
end
