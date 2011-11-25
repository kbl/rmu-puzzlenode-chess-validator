module Chess
  module Chessman
    module Movement
      class Move

        attr_accessor :stop_sequence
        
        def initialize(cords, validator = Validator.no_op, sequence_stopping = false)
          @cords, @validator, @sequence_stopping = cords, validator, sequence_stopping
          @sequence_stopped = false
        end

        def valid?(board)
          if @sequence_stopping
            @validator.valid?(board, @cords, self)
          else
            @validator.valid?(board, @cords)
          end
        end

        def to_s
          @cords
        end

        def cords
          [@cords]
        end

        def stop_sequence!
          @sequence_stopped = true
        end

        def sequence_stopped?
          @sequence_stopped
        end

      end
    end
  end
end
