require 'spec_helper'

module Chess
  module Chessman
    describe King do
      describe 'King#moves' do

        let(:board) { Board.new }

        it 'should allow for all moves on empty board' do
          k = King.white('d4')
          k.moves(board).should =~ %w(c3 d3 e3 c4 e4 c5 d5 e5)
        end

        it 'shouldnt allow move to fields occupied fields' do
          k = King.white('d4')
          k.moves(board).should =~ %w(c3 d3 e3 c4 e4 c5 d5 e5)
        end
      end
    end
  end
end
