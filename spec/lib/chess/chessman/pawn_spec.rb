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

        context 'movement from first line' do
          it 'should allow move by 2 field from first line (white)' do
            p = Pawn.new('b2', :white)
            p.moves(board).should == ['b3', 'b4']
          end
          it 'should allow move by 2 field from first line (black)' do
            p = Pawn.new('e7', :black)
            p.moves(board).should == ['e6', 'e5']
          end
        end

        context 'movement to occupied position' do
          it 'shouldnt allow for movement to occupied position' do
            p = Pawn.new('c3', :white)
            b = Board.new
            b << Pawn.new('c4', :black)

            p.moves(board).should == []
          end
        end
      end

    end
  end
end
