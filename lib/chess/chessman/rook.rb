require 'chess/chessman/base'
require 'chess/chessman/move'

module Chess
  module Chessman
    class Rook < Base

      class << self
        attr_reader :moves

        def initialize_moves
          @moves = []

          @validator = Proc.new do |chessman, board, move|
            !board[*move]
          end

          field_range = (-7..7).to_a
          field_range.delete(0)
          field_range.each do |value|
            @moves << Move.new(0, value, &@validator)
            @moves << Move.new(value, 0, &@validator)
          end
        end
      end

      initialize_moves

      def each
        Rook.moves.each { |m| yield m }
      end

    end
  end
end
