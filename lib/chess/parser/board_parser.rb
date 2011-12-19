require 'chess/chessman/chessman_factory'

module Chess
  module Parser
    class BoardParser

      include Chessman

      def initialize(stream)
        @stream = stream
      end

      def parse
        return @chessmen if @chessmen

        initialize_chessmen

        @chessmen
      end

      private

      EMPTY_FIELD = '--'
      WHITE_SYMBOL = 'w'

      def initialize_chessmen
        @chessmen = []
        @column = 1
        @row = 8

        @stream.each_line do |line|

          line.split.each do |symbol|
            unless symbol == EMPTY_FIELD
              color, chessman_symbol = symbol.split('')
              @chessmen << ChessmanFactory.new_chessman(
                [@column, @row], 
                color, 
                chessman_symbol)
            end
            @column += 1
          end

          @row -= 1
          @column = 1
        end
      end

    end
  end
end
