require 'spec_helper'

module Chess
  module Chessman
    describe Pawn do
      describe 'Pawn#moves' do

        let(:board) { Board.new }

        def white(field)
          Pawn.white(field)
        end
        def black(field)
          Pawn.black(field)
        end

        context 'standard movement by one field' do
          context 'white' do
            it 'pawn moves one by one field' do
              p = white('c4')
              p.moves(board).should == ['c5']
            end
            it 'shouldnt allow to move from last line' do
              p = white('h8')
              p.moves(board).should == []
            end
          end
          it 'pawn moves one by one field (black)' do
            p = black('a4')
            p.moves(board).should == ['a3']
          end
          it 'shouldnt allow to move from last line (black)' do
            p = black('c1')
            p.moves(board).should == []
          end
        end

        context 'movement from first line' do
          it 'should allow move by 2 field from first line (white)' do
            p = white('b2')
            p.moves(board).should == ['b3', 'b4']
          end
          it 'should allow move by 2 field from first line (black)' do
            p = black('e7')
            p.moves(board).should == ['e6', 'e5']
          end
        end

        context 'movement to occupied position' do
          it 'shouldnt allow for movement to occupied position (white)' do
            p = white('c3')
            board << black('c4')

            p.moves(board).should == []
          end
          it 'shouldnt allow for movement to occupied position (black)' do
            p = black('d6')
            board << black('d5')

            p.moves(board).should == []
          end
          context 'movement by two fields' do
            it 'shouldnt allow for movement to occupied position (white)' do
              p = white('E2')
              board << black('e3')

              p.moves(board).should == []
            end
            it 'shouldnt allow for movement to occupied position (white)' do
              p = black('f7')
              board << black('f6')

              p.moves(board).should == []
            end
          end
          context 'capture other chessman' do
            it 'should be possible to capture different color man' do
              pending
              p = black('G5')
              board << white('f4')
              board << white('h4')

              p.moves(board).should == ['f4', 'h4', 'g4']
            end
          end
        end
      end

    end
  end
end
