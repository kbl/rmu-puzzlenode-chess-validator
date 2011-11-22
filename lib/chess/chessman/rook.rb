require 'chess/chessman/base'
require 'chess/chessman/move'

module Chess
  module Chessman
    class Rook < Base

      def moves(board)
        cords = []

        fields_from_cords(cords)
      end
    end
  end
end
