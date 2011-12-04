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
      end
    end
  end
end
