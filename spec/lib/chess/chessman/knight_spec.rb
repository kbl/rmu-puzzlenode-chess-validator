require 'spec_helper'

module Chess
  module Chessman
    describe Knight do
      describe 'Knight#moves' do

        let(:board) { Board.new }

        it 'should allow for 8 moves on empty board' do
          pending
          k = Knight.white('d4')
          k.moves.should =~ ['c2', 'e2', 'b3', 'f3', 'b5', 'f5', 'c6', 'e6']
        end
      end
    end
  end
end
