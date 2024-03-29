module Chess
  module Chessman
    module Movement
      class MoveSequence

        SEQUENCES = [
            (-7..-1).to_a.reverse, # left, bottom
            (1..7).to_a # right, up
        ]

        def initialize
          @moves = []
          @stopped = false
        end

        def <<(move)
          @moves << move
        end

        def cords
          @cords
        end

        def empty?
          @moves.empty?
        end

        def valid?(board)
          @cords = []

          @moves.each do |move|
            break unless move.valid?(board)
            @cords << move.cords
            break if move.sequence_stopped?
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
