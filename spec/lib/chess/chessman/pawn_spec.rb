require 'spec_helper'

module Chess
  module Chessman
    describe Pawn do
      describe 'Pawn#moves' do

        let(:board) { Board.new }

        context 'standard movement by one field' do
          it 'pawn moves one by one field (white)' do
            p = Pawn.new('c4', :white)
            p.moves(board).should == ['c5']
          end
          it 'pawn moves one by one field (black)' do
            p = Pawn.new('a4', :black)
            p.moves(board).should == ['a3']
          end
          it 'shouldnt allow to move from last line (white)' do
            p = Pawn.new('h8', :white)
            p.moves(board).should == []
          end
          it 'shouldnt allow to move from last line (black)' do
            p = Pawn.new('c1', :black)
            p.moves(board).should == []
          end
        end
      end

    end
  end
end
