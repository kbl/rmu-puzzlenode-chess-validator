module Chess
  module Chessman
    module Movement
      class Validator

        def self.no_op
          Validator.new { true }
        end

        def initialize(break_sequence = false, &validation_block)
          @break_sequence = break_sequence
          @validation_block = validation_block
        end

        def valid?(chessman, board, cords)
          @validation_block.call(chessman, board, cords)
        end

        def break_sequence?
          @break_sequence
        end
      end
    end
  end
end
