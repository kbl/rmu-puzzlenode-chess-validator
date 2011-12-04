require 'spec_helper'

module Chess
  module Chessman
    describe ChessmanFactory do
      describe 'ChessmanFactory.new_chessman' do
        it 'should create white pawn on c2' do
          p = ChessmanFactory.new_chessman([3, 2], 'w', 'P')
          p.should_not be_nil
        end
      end
    end
  end
end
