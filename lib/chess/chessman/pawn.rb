require 'chess/chessman/base'
require 'chess/chessman/move'

module Chess
  module Chessman
    class Pawn < Base
      
      class << self

        attr_reader :moves

        def create_moves
          @moves = {white: [], black: []}
          @moves[:white] << Move.new(0, 1) do |chessman, board, move|   
            !board[*move]
          end
          @moves[:white] << Move.new(0, 2) do |chessman, board, move|
            chessman.y == Base::FIRST_LINE_WHITE && !board[*move]
          end

          @moves[:black] << Move.new(0, -1) do |chessman, board, move|   
            !board[*move]
          end
          @moves[:black] << Move.new(0, -2) do |chessman, board, move|
            chessman.y == Base::FIRST_LINE_BLACK && !board[*move]
          end
        end
      end

      create_moves

      def moves(board)
        cords = []

        Pawn.moves[color].each do |move|
          cords << move.valid?(self, board)
        end

        fields_from_cords(cords)
      end

    end
  end
end
