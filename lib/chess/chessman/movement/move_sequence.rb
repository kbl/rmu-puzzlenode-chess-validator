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

        def valid_cords(chessman, board)
          return_values = []
          previous_valid = true

          @moves.each do |move|
            valid_move_cords = move.valid_cords(chessman, board)
            break unless valid_move_cords

            return_values << valid_move_cords
          end

          return_values.flatten(1)
        end

      end
    end
  end
end
