require 'chess/chessman/base'
require 'chess/chessman/move'

module Chess
  module Chessman
    class Knight < Base

      class << self
        attr_reader :moves

        def initialize_moves
          @moves = []

          create_validator
          fill_moves
        end

        private

        def create_validator
          @validator = Proc.new do |chessman, board, move|
            new_chessman = board[*move]
            !new_chessman ||  new_chessman.color != chessman.color
          end
        end

        def fill_moves
          @moves << Move.new(-1, -2, &@validator)
          @moves << Move.new(1, -2, &@validator)
          @moves << Move.new(-2, -1, &@validator)
          @moves << Move.new(2, -1, &@validator)
          @moves << Move.new(-2, 1, &@validator)
          @moves << Move.new(2, 1, &@validator)
          @moves << Move.new(-1, 2, &@validator)
          @moves << Move.new(1, 2, &@validator)
        end
      end

      initialize_moves

      def moves(board)
        cords = []

        Knight.moves.each do |move|
          cords << move.valid?(self, board)
        end

        fields_from_cords(cords)
      end

    end
  end
end
