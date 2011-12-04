require 'chess/chessman/base'
require 'chess/parser'
require 'set'

module Chess
  class Board

    ZERO_BASED = 1

    def initialize(file = nil)
      @board = []
      8.times { @board << [] }

      if file
        parser = Parser.new(file)
        p.parse.each { |chessman| self.<<(chessman) }
      end
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

      @board.flatten.reject(&:nil?).each do |chessman|
        color = chessman.opposite_color
        chessman.capturing_moves(self).each do |move|
          @check[color] << move
        end
      end
    end

  end
end
