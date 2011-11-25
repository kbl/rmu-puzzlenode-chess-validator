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
        create_validator
        initialize_possible_moves
      end

      def each
        @possible_moves.each { |m| yield m }
      end

      private
      
      def create_validator
        @validator = Validator.new(self) do |chessman, destination_chessman|
          !destination_chessman || destination_chessman.color != chessman.color
        end
      end

      def initialize_possible_moves do
        @possible_moves = []

        MOVES_VECTORS.each do |vector|
          cords = cords_from_vector(*vector)
          @possible_moves << Move.new(cords, @validator) if cords
        end
      end

    end
  end
end
