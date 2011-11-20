require 'chess/chessman/base'

module Chess
  class Board

    ZERO_BASED = 1

    def initialize
      @board = []
      8.times { @board << [] }
    end

    def <<(chessman)
      @board[chessman.y][chessman.x] = chessman
    end

    def [](x, y)
      Chessman::Base.validate_position(x, y)
      @board[y][x]
    end
    def position(position)
      self.[](*Chessman::Base.cords(position))
    end
  end
end
