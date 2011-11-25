require 'spec_helper'

module Chess
  module Chessman
    describe Bishop do
      describe 'Bishop#moves' do

        let(:board) { Board.new }

        it 'should allow for movement on skew lines' do
          r = Bishop.white('f6')
          r.moves(board).should =~ ['g7', 'h8', 'e5', 'd4', 'c3', 'b2', 'a1', 'e7', 'd8', 'g5', 'h4']
        end

        it 'should allow for capturing' do
          r = Bishop.white('f6')
          board << Bishop.black('b2')

          r.moves(board).should =~ ['g7', 'h8', 'e5', 'd4', 'c3', 'b2', 'e7', 'd8', 'g5', 'h4']
        end

        it 'shouldnt allow for jumping over chessmans of same color' do
          r = Bishop.white('f6')
          board << Bishop.white('g7')

          r.moves(board).should =~ ['e5', 'd4', 'c3', 'b2', 'a1', 'e7', 'd8', 'g5', 'h4']
        end
        
      end
    end
  end
end
