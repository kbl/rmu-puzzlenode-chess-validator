require 'chess/chessman/base'

module Chess
  module Chessman
    class Rook < Base

      def initialize(position, color)
        super
        initialize_validator
        initialize_possible_moves
      end

      def each
        @possible_moves.each { |m| yield m }
      end

      private

      def initialize_validator
        @validator = Validator.new do |chessman|
          !chessman || chessman.color != color
        end
      end

      def initialize_possible_moves
        @possible_moves = []

        left_bottom = (-7..-1).to_a.reverse
        right_up = (1..7).to_a

        left_sequence = MoveSequence.new
        bottom_sequence = MoveSequence.new
        left_bottom.each do |value|
          bottom_sequence << Move.new(0, value, @validator)
          left_sequence << Move.new(value, 0, @validator)
        end
        @moves << left_sequence
        @moves << bottom_sequence

        right_sequence = MoveSequence.new
        up_sequence = MoveSequence.new
        right_up.each do |value|
          up_sequence << Move.new(0, value, @validator)
          right_sequence << Move.new(value, 0, @validator)
        end
        @moves << right_sequence
        @moves << up_sequence
      end

    end
  end
end
