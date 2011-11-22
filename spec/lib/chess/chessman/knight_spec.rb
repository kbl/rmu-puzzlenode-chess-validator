require 'spec_helper'

module Chess
  module Chessman
    describe Knight do
      describe 'Knight#moves' do

        let(:board) { Board.new }

        context 'empty board' do
          it 'should allow for 8 moves on empty board' do
            k = Knight.white('d4')
            k.moves(board).should =~ ['c2', 'e2', 'b3', 'f3', 'b5', 'f5', 'c6', 'e6']
          end

          it 'should allow for 2 movements from board corner' do
            k = Knight.white('h8')
            k.moves(board).should =~ ['f7', 'g6']
          end
        end
      end
    end
  end
end
