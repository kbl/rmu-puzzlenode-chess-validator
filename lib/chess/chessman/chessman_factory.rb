require 'chess/chessman/pawn'
require 'chess/chessman/rook'
require 'chess/chessman/knight'
require 'chess/chessman/bishop'
require 'chess/chessman/queen'
require 'chess/chessman/king'

module Chess
  module Chessman
    class ChessmanFactory

      WHITE_SYMBOL = 'w'

      CHESSMEN = {
        P: Pawn,
        R: Rook,
        N: Knight,
        B: Bishop,
        Q: Queen,
        K: King
      }

      class << self

        def new_chessman(cords, color_symbol, chessman_symbol)
          method_name = :black
          if WHITE_SYMBOL == color_symbol
            method_name = :white
          end
          CHESSMEN[chessman_symbol.to_sym].send(method_name, cords)
        end

      end
    end
  end
end

