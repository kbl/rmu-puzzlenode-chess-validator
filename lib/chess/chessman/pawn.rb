require 'chess/chessman/base'

module Chess
  module Chessman
    class Pawn < Base

      UPWARDS = 1
      DOWNWARDS = -1

      FIRST_LINE_WHITE = 2
      FIRST_LINE_BLACK = 7
      
      def initialize(position, color)
        super
        initialize_validators
        initialize_possible_moves
      end

      def each
        @possible_moves.each { |m| yield m }
      end

      private

      def initialize_possible_moves
        @possible_moves = {white: [], black: []}

        create_validations
        fill_moves
      end

      private

      def initialize_validators
        @capturing_validator = Validator.new(self) do |chessman, destination_chessman|
          destination_chessman && destination_chessman.color != chessman.color
        end                                

        @first_line_validator = Validator.new do |chessman, destination_chessman|
          first_line = Pawn.const_get("FIRST_LINE_#{chessman.color.upcase}")
          chessman.y == first_line && !destination_chessman
        end

        @empty_field_validator = Validator.new do |chessman, destination_chessman|
          !destination_chessman
        end
      end

      def fill_moves
        { white: UPWARDS, black: DOWNWARDS }.each do |color, direction|
          sequence = MoveSequence.new
          sequence << Move.new(0, 1 * direction, @empty_field_validator)
          sequence << Move.new( 0, 2 * direction, @first_line_validator)
          @moves[color] << sequence

          @moves[color] << Move.new(-1, 1 * direction, @capturing_validator)
          @moves[color] << Move.new( 1, 1 * direction, @capturing_validator)
        end
      end

    end
  end
end
