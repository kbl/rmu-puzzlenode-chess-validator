require 'chess/chessman/base'
require 'chess/chessman/move'

module Chess
  module Chessman
    class Pawn < Base
      
      class << self

        attr_reader :moves

        def create_moves
          @moves = []
          @moves << Move.white(0, 1)
          @moves << Move.white(0, 2) do |chessman|
            chessman.y == Base::FIRST_LINE_WHITE
          end

          @moves << Move.black(0, -1)
          @moves << Move.black(0, -2) do |chessman|
            chessman.y == Base::FIRST_LINE_BLACK
          end
        end
      end

      create_moves

      def moves(board)
        cords = []

        Pawn.moves.each do |move|
          cords << move.valid?(self, board)
        end

        fields_from_cords(cords)
      end

    end
  end
end
