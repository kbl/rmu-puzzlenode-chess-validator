require 'chess/chessman/base'

module Chess
  module Chessman
    class Pawn < Base
      def moves(board)
        cords = []

        if color == :white
          cords << [0, 1]
          cords << [0, 2] if y == FIRST_LINE_WHITE
        else
          cords << [0, -1]
          cords << [0, -2] if y == FIRST_LINE_BLACK
        end

        moves_from_positions(cords)
      end
    end
  end
end
