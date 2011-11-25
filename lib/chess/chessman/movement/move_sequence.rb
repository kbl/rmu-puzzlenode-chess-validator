module Chess
  module Chessman
    module Movement
      class MoveSequence

        def initialize
          @moves = []
        end

        def <<(move)
          @moves << move
        end

        def cords
          @cords
        end

        def valid?(board)
          @cords = []

          @moves.each do |move|
            break unless move.valid?(board)
            @cords << move.cords
          end
          @cords.flatten!(1)
          !@cords.empty?
        end

        def to_s
          "S#{@moves}"
        end

      end
    end
  end
end
