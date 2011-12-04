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

        def new_chessman(cords, color_symbol, symbol)
          method_name = :black
          if WHITE_SYMBOL == color_symbol
            method_name = :white
          end
          p method_name
        end

      end
    end
  end
end

