require 'spec_helper'

module Chess
  module Chessman
    describe Queen do
      describe 'Queen#moves' do

        let(:board) { Board.new }

        it 'should allow for horizontal/vertical diagonal moves' do
          pending
          q = Queen.white('c4')

          q.moves(board).should =~ [
            'b3', 'a2', 'd5', 'e6', 'f7', 'g8', # /
            'b5', 'a6', 'd3', 'e2', 'f1', # \
            'c3', 'c2', 'c1', 'c5', 'c6', 'c7', 'c8', # |
            'a4', 'b4', 'd4', 'f4', 'g4', 'h4' # --
          ]
        end

      end
    end
  end
end
