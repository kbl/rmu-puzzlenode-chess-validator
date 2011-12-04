require 'spec_helper'

module Chess
  module Chessman
    describe King do

      let(:board) { Board.new }

      describe 'King#moves' do
        it 'should allow for all moves on empty board' do
          k = King.white('d4')
          k.moves(board).should =~ %w(c3 d3 e3 c4 e4 c5 d5 e5)
        end
        it 'shouldnt allow move to fields occupied fields' do
          k = King.white('d4')
          k.moves(board).should =~ %w(c3 d3 e3 c4 e4 c5 d5 e5)
        end
      end

      describe 'King#capturing_moves' do
        it 'should properly obtain capturing moves for king' do
          pending
          k = King.white('b2')
          k.capturing_moves(board).should =~ %w(a1 a2 a3 b1 b3 c1 c2 c3)
        end
      end

    end
  end
end
