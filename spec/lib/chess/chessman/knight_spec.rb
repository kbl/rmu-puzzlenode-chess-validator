require 'spec_helper'

module Chess
  module Chessman
    describe Knight do

      let(:board) { Board.new }

      describe 'Knight#moves' do
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
        context 'capturing' do
          it 'should allow capturing different color chessman' do
            k = Knight.white('b8')
            board << Pawn.black('d7')

            k.moves(board).should =~ ['a6', 'c6', 'd7']
          end
          it 'shouldnt allow capturing same color chessman' do
            k = Knight.white('b8')
            board << Pawn.white('d7')

            k.moves(board).should =~ ['a6', 'c6']
          end
        end
      end

      describe 'Knight#capture_moves' do
        it 'should properly find capturing moves' do
          k = Knight.white('b8')
          board << Pawn.white('d7')

          k.capturing_moves(board).should =~ ['a6', 'c6', 'd7']
        end
      end
    end
  end
end
