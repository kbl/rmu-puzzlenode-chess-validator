require 'chess/chessman/base'

module Chess
  module Chessman
    class Pawn < Base

      UPWARDS = 1
      DOWNWARDS = -1
      
      class << self
        attr_reader :moves

        def initialize_moves
          @moves = {white: [], black: []}

          create_validations
          fill_moves
        end

        private

        def create_validations
          @capturing_validator = Validator.new do |chessman, board, move|
            other_chessman = board[*move]
            other_chessman && other_chessman.color != chessman.color
          end                                

          @first_line_validator = Validator.new do |chessman, board, move|
            first_line = Base.const_get("FIRST_LINE_#{chessman.color.upcase}")
            chessman.y == first_line && !board[*move]
          end

          @empty_field_validator = Validator.new do |chessman, board, move|
            !board[*move]
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

      initialize_moves

      def each
        Pawn.moves[color].each { |m| yield m }
      end

    end
  end
end
