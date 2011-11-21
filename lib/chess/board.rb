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
      raise 'illegal argument' unless Chessman::Base.valid_cords?(x, y)
      @board[y][x]
    end
    def field(field)
      self.[](*Chessman::Base.cords(field))
    end
  end
end
