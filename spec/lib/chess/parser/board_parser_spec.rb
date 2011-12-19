require 'spec_helper'

module Chess
  module Parser
    describe BoardParser do
      it 'should properly parse board' do
        board = StringIO.new <<-EOS
          bR bN bB bQ bK bB bN bR
          bP bP bP bP bP bP bP bP
          -- -- -- -- -- -- -- --
          -- -- -- -- -- -- -- --
          -- -- -- -- -- -- -- --
          -- -- -- -- -- -- -- --
          wP wP wP wP wP wP wP wP
          wR wN wB wQ wK wB wN wR
        EOS
        p = BoardParser.new(board)
        chessmen = p.parse

        chessmen.size.should == 32
        chessmen[0].should be_chessman('a8', :black, Chess::Chessman::Rook)
        chessmen[30].should be_chessman('g1', :white, Chess::Chessman::Knight)
      end
    end
  end
end
