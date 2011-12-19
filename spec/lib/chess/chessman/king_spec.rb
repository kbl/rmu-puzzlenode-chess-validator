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
        context 'check' do
          it 'shouldnt allow for moves on checked fields #1' do
            k = King.white('d4')
            board << k

            board << Rook.black('c2')
            board << Bishop.black('h7')
            board << Pawn.black('f6')

            k.moves(board).should =~ %w(d5 e3)
          end
          it 'shouldnt allow for moves on checked fields #2' do
            k = King.white('f5')
            board << k

            board << Queen.black('d6')
            board << King.black('e3')

            k.moves(board).should =~ %w(g5 g4)
          end
          it 'shouldnt allow for moves on checked fields #3' do
            k = King.white('f5')
            board << k

            board << Queen.black('d6')
            board << Knight.black('f2')

            k.moves(board).should =~ %w(g5)
          end
          it 'shouldnt allow for moves on checked fields #5' do
            k = King.black('c7')
            board << k

            board << King.white('a5')
            board << Pawn.white('d6')
            board << Bishop.white('f3')
            board << Bishop.white('f4')

            k.moves(board).should =~ %w(b8 c8 d7 d8)
          end
          it 'shouldnt allow for moves on checked fields #5' do
            k = King.black('c7')
            board << k

            board << King.white('a5')
            board << Pawn.white('d6')
            board << Bishop.white('f3')

            k.moves(board).should =~ %w(b8 c8 d6 d7 d8)
          end
        end
      end

      describe 'King#capturing_moves' do
        it 'should properly obtain capturing moves for king' do
          k = King.white('b2')
          k.capturing_moves(board).should =~ %w(a1 a2 a3 b1 b3 c1 c2 c3)
        end
        it 'should show captruring moves for occupied fields' do
          k = King.white('a3')
          board << Pawn.white('b3')
          board << Pawn.black('a2')

          k.capturing_moves(board).should =~ %w(a2 a4 b2 b3 b4)
        end
      end

    end
  end
end
