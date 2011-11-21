require 'spec_helper'

module Chess
  module Chessman
    describe Pawn do
      describe 'Pawn#moves' do

        let(:board) { Board.new }

        context 'standard movement by one field' do
          it 'pawn moves one by one field (white)' do
            p = Pawn.white('c4')
            p.moves(board).should == ['c5']
          end
          it 'pawn moves one by one field (black)' do
            p = Pawn.black('a4')
            p.moves(board).should == ['a3']
          end
          it 'shouldnt allow to move from last line (white)' do
            p = Pawn.white('h8')
            p.moves(board).should == []
          end
          it 'shouldnt allow to move from last line (black)' do
            p = Pawn.black('c1')
            p.moves(board).should == []
          end
        end

        context 'movement from first line' do
          it 'should allow move by 2 field from first line (white)' do
            p = Pawn.white('b2')
            p.moves(board).should == ['b3', 'b4']
          end
          it 'should allow move by 2 field from first line (black)' do
            p = Pawn.black('e7')
            p.moves(board).should == ['e6', 'e5']
          end
        end

        context 'movement to occupied position' do
          it 'shouldnt allow for movement to occupied position (white)' do
            p = Pawn.white('c3')

            b = Board.new
            b << Pawn.black('c4')

            p.moves(b).should == []
          end
          it 'shouldnt allow for movement to occupied position (black)' do
            p = Pawn.black('d6')

            b = Board.new
            b << Pawn.black('d5')

            p.moves(b).should == []
          end
          context 'movement by two fields' do
            it 'shouldnt allow for movement to occupied position (white)' do
              pending
              p = Pawn.white('E2')

              b = Board.new
              b << Pawn.black('e3')

              p.moves(b).should == []
            end
          end
        end
      end

    end
  end
end
