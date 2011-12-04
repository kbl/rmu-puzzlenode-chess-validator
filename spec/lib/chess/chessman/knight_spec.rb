require 'spec_helper'

module Chess
  module Chessman
    describe Knight do

      let(:board) { Board.new }

      describe 'Knight#moves' do
        context 'empty board' do
          it 'should allow for 8 moves on empty board' do
            k = Knight.white('d4')
            k.moves(board).should =~ %w(c2 e2 b3 f3 b5 f5 c6 e6)
          end
          it 'should allow for 2 movements from board corner' do
            k = Knight.white('h8')
            k.moves(board).should =~ %w(f7 g6)
          end
        end
        context 'capturing' do
          it 'should allow capturing different color chessman' do
            k = Knight.white('b8')
            board << Pawn.black('d7')

            k.moves(board).should =~ %w(a6 c6 d7)
          end
          it 'shouldnt allow capturing same color chessman' do
            k = Knight.white('b8')
            board << Pawn.white('d7')

            k.moves(board).should =~ %w(a6 c6)
          end
          it 'should properly find capturing moves' do
            k = Knight.white('b8')
            board << Pawn.white('d7')
            board << Pawn.black('c6')

            k.capturing_moves(board).should =~ %w(a6 c6 d7)
          end
        end
      end
    end
  end
end
