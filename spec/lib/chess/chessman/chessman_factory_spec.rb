require 'spec_helper'

module Chess
  module Chessman
    describe ChessmanFactory do
      describe 'ChessmanFactory.new_chessman' do
        it 'should create white pawn on c2' do
          p = ChessmanFactory.new_chessman([3, 2], 'w', 'P')
          p.should be_chessman('c2', :white, Pawn)
        end
        it 'should create black pawn on a7' do
          p = ChessmanFactory.new_chessman([1, 7], 'b', 'P')
          p.should be_chessman('a7', :black, Pawn)
        end
        it 'should create white rook on b4' do
          p = ChessmanFactory.new_chessman([2, 4], 'w', 'R')
          p.should be_chessman('b4', :white, Rook)
        end
        it 'should create black bishop on h8' do
          p = ChessmanFactory.new_chessman([8, 8], 'b', 'B')
          p.should be_chessman('h8', :black, Bishop)
        end
        it 'should create white knight on d5' do
          p = ChessmanFactory.new_chessman([4, 5], 'w', 'N')
          p.should be_chessman('d5', :white, Knight)
        end
        it 'should create black Queen on e6' do
          p = ChessmanFactory.new_chessman([5, 6], 'b', 'Q')
          p.should be_chessman('e6', :black, Queen)
        end
        it 'should create white king on g1' do
          p = ChessmanFactory.new_chessman([7, 1], 'w', 'K')
          p.should be_chessman('g1', :white, King)
        end
      end
    end
  end
end
