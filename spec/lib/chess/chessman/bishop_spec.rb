require 'spec_helper'

module Chess
  module Chessman
    describe Bishop do
      describe 'Bishop#moves' do

        let(:board) { Board.new }

        it 'should allow for movement on horizontal/vertical lines' do
          pending
          r = Bishop.white('f6')
          r.moves(board).should =~ ['g7', 'h8', 'e5', 'd4', 'c3', 'b2', 'a1', 'e7', 'd8', 'g5', 'h4']
        end
        
      end
    end
  end
end
