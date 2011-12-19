require 'chess/board'
require 'chess/parser/input_parser'

module Chess
  class RmuValidator

    include Chess::Parser

    attr_reader :board
    
    def initialize(file_path)
      File.open(file_path) do |file|
        @board = Board.new(file)
      end
    end

    def validate(file_path)
      output = []
      File.open(file_path) do |file|
        input_parser = InputParser.new(file)
        input_parser.each do |field_from, field_to|
          chessman = @board.field(field_from)
          if chessman
            output << chessman.moves(@board).include?(field_to)
          else
            output << false
          end
        end
      end
      output
    end
    
  end
end
