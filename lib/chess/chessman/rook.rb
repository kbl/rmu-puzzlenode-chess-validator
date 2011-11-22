require 'chess/chessman/base'
require 'chess/chessman/move'

module Chess
  module Chessman
    class Rook < Base

      class << self
        attr_reader :moves
      end

      def each
        Rook.moves.each { |m| yield m }
      end

    end
  end
end
