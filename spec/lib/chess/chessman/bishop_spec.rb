require 'spec_helper'

module Chess
  module Chessman
    describe Bishop do

      let(:board) { Board.new }

      describe 'Bishop#moves' do
        it 'should allow for movement on skew lines' do
          r = Bishop.white('f6')
          r.moves(board).should =~ %w(g7 h8 e5 d4 c3 b2 a1 e7 d8 g5 h4)
        end
        it 'should allow for capturing' do
          r = Bishop.white('f6')
          board << Bishop.black('b2')

          r.moves(board).should =~ %w(g7 h8 e5 d4 c3 b2 e7 d8 g5 h4)
        end
        it 'shouldnt allow for jumping over chessmans of same color' do
          r = Bishop.white('f6')
          board << Bishop.white('g7')

          r.moves(board).should =~ %w(e5 d4 c3 b2 a1 e7 d8 g5 h4)
        end
      end

      describe 'Bishop#capturing_moves' do
        it 'should properly find capturing moves' do
          r = Bishop.white('f6')
          r.capturing_moves(board).should =~ %w(g7 h8 e5 d4 c3 b2 a1 e7 d8 g5 h4)
        end

        it 'should allow capturing moves for occupied fields' do
          r = Bishop.white('f6')
          board << Bishop.black('b2')
          board << Bishop.white('g7')

          r.capturing_moves(board).should =~ %w(g7 e5 d4 c3 b2 e7 d8 g5 h4)
        end
      end
    end
  end
end
