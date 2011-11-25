require 'chess/chessman/base'

module Chess
  module Chessman
    class Rook < Base

      def initialize(position, color)
        super
        initialize_validator
        initialize_possible_moves
      end

      private

      def initialize_possible_moves
        @possible_moves = []

        sequences_row = [
          left = (-7..-1).to_a.reverse,
          right = (1..7).to_a]
        sequences_column = [
          up = (1..7).to_a,
          bottom = (-7..-1).to_a.reverse]
          
        sequences_row.each do |row|
          sequence = MoveSequence.new
          row.each do |vector_x|
            cords = cords_from_vector(vector_x, 0)
            break unless cords
            sequence << Move.new(cords, @validator, :braking)
          end
          @possible_moves << sequence unless sequence.empty?
        end

        sequences_column.each do |column|
          sequence = MoveSequence.new
          column.each do |vector_y|
            cords = cords_from_vector(0, vector_y)
            break unless cords
            sequence << Move.new(cords, @validator, :braking)
          end
          @possible_moves << sequence unless sequence.empty?
        end
      end

      def initialize_validator
        @validator = Validator.new do |chessman, move|
          if !chessman
            true
          else
            could_be_captured = chessman.color != color
            move.stop_sequence! if could_be_captured
          
            could_be_captured
          end
        end
      end

    end
  end
end
