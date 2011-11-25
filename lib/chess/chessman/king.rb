require 'chess/chessman/base'

module Chess
  module Chessman
    class King < Base

      MOVE_VECTORS = (-1..1).to_a.repeated_permutation(2).reject { |x, y| x == 0 && y == 0 }
      
      def initialize(position, color)
        super
        initialize_possible_moves
      end

      private

      def initialize_possible_moves
        @possible_moves = []
        @validator = Validator.new do |chessman, board|
          !chessman || chessman.color != color
        end

        MOVE_VECTORS.each do |vector|
          cords = cords_from_vector(*vector)
          @possible_moves << Move.new(cords, @validator) if cords
        end
      end

    end
  end
end
