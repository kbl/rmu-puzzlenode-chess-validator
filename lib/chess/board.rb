require 'chess/chessman/base'

module Chess
  class Board

    ZERO_BASED = 1

    def initialize
      @board = []
      8.times { @board << [] }
    end

    def <<(chessman)
      @board[chessman.y - ZERO_BASED][chessman.x - ZERO_BASED] = chessman
    end

    def [](x, y)
      raise 'illegal argument' unless Chessman::Base.valid_cords?(x, y)
      @board[y - ZERO_BASED][x - ZERO_BASED]
    end
    def field(field)
      self.[](*Chessman::Base.cords(field))
    end
  end
end
