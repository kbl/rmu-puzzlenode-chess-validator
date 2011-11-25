require 'chess/chessman/base'

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
            !new_chessman || new_chessman.color != chessman.color
          end
        end

        def fill_moves
          @moves << Move.new(-1, -2, &@validator)
          @moves << Move.new( 1, -2, &@validator)
          @moves << Move.new(-2, -1, &@validator)
          @moves << Move.new( 2, -1, &@validator)
          @moves << Move.new(-2,  1, &@validator)
          @moves << Move.new( 2,  1, &@validator)
          @moves << Move.new(-1,  2, &@validator)
          @moves << Move.new( 1,  2, &@validator)
        end
      end

      initialize_moves

      def each
        Knight.moves.each { |m| yield m }
      end

    end
  end
end
