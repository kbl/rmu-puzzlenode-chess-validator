require 'chess/chessman/base'
require 'chess/chessman/move'

module Chess
  module Chessman
    class Pawn < Base
      
      class << self
        attr_reader :moves

        def initialize_moves
          @moves = {white: [], black: []}
          @moves[:white] << Move.new(0, 1) do |chessman, board, move|   
            !board[*move]
          end
          @moves[:white] << Move.new(0, 2) do |chessman, board, move|
            chessman.y == Base::FIRST_LINE_WHITE && !board[*move] && @moves[:white][0].valid?(chessman, board)
          end

          @moves[:black] << Move.new(0, -1) do |chessman, board, move|   
            !board[*move]
          end
          @moves[:black] << Move.new(0, -2) do |chessman, board, move|
            chessman.y == Base::FIRST_LINE_BLACK && !board[*move] && @moves[:black][0].valid?(chessman, board)
          end
        end
      end

      initialize_moves

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
