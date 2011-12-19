require 'spec_helper'

module Chess
  module Chessman
    describe Queen do

      let(:board) { Board.new }

      describe 'Queen#moves' do
        it 'should allow for horizontal/vertical diagonal moves' do
          q = Queen.white('c4')

          q.moves(board).should =~ %w(
            b3 a2 d5 e6 f7 g8 
            b5 a6 d3 e2 f1
            c3 c2 c1 c5 c6 c7 c8
            a4 b4 d4 e4 f4 g4 h4)
        end
      end

      describe 'Queen#capturing_moves' do
        it 'should allow for horizontal/vertical diagonal capturing moves' do
          q = Queen.white('c4')

          q.capturing_moves(board).should =~ %w(
            b3 a2 d5 e6 f7 g8
            b5 a6 d3 e2 f1
            c3 c2 c1 c5 c6 c7 c8 
            a4 b4 d4 e4 f4 g4 h4)
        end
        it 'should allow for horizontal/vertical diagonal capturing moves on occupied fields' do
          q = Queen.white('c4')
          board << Pawn.white('b3')
          board << Rook.black('e6')

          board << Bishop.black('b5')
          board << Bishop.white('e2')

          board << Knight.white('c2')
          board << Pawn.black('c7')

          board << Pawn.black('b4')
          board << Pawn.white('f4')

          q.capturing_moves(board).should =~ %w(
            b3 d5 e6
            b5 d3 e2
            c3 c2 c5 c6 c7
            b4 d4 e4 f4)
        end
      end
    end
  end
end
