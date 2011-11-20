require 'chess/chessman/base'

module Chess
  module Chessman
    class Pawn < Base
      def moves(board)
        moves = []

        begin
          if color == :white
            moves << Base.position(x, y + 1)
          else
            moves << Base.position(x, y - 1)
          end
        rescue
        end
        
        moves
      end
    end
  end
end
