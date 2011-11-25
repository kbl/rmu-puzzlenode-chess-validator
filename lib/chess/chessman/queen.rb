require 'chess/chessman/base'

module Chess
  module Chessman
    class Queen < Base
      
      def initialize(position, color)
        super
        initialize_possible_moves
      end

      private

      def initialize_possible_moves
        @validator = Validator.new_sequence_validator(@color)
        @possible_moves = []
      end

    end
  end
end
