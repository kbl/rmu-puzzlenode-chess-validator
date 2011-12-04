require 'chess/board'

module Chess
  class RmuValidator

    attr_reader :board
    
    def initialize(file_path)
      File.open(file_path) do |file|
        @board = Board.new(file)
      end
    end
    
  end
end
