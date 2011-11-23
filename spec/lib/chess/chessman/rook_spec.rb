require 'spec_helper'

module Chess
  module Chessman
    describe Rook do
      describe 'Rook#moves' do

        let(:board) { Board.new }

        it 'should allow for movement on horizontal/vertical lines' do
          r = Rook.white('d4')
          r.moves(board).should =~ ['d1', 'd2', 'd3', 'd5', 'd6', 'd7', 'd8', 'a4', 'b4', 'c4', 'e4', 'f4', 'g4', 'h4']
        end

      end
    end
  end
end
