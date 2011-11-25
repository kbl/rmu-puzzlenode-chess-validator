require 'chess/chessman/base'
require 'set'

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

    def check?(color, field)
      unless @check
        initialize_check
      end
      @check[color].include?(field)
    end

    private

    def initialize_check
      @check = { white: Set.new, black: Set.new }

      @board.flatten.each do |chessman|
        @check[chessman.color] << chessman.capturing_moves(self)
      end
    end

  end
end
