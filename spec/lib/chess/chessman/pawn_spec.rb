require 'spec_helper'

module Chess
  module Chessman
    describe Pawn do
      describe 'Pawn#moves' do

        context 'standard movement by one field' do
          it 'pawn moves one by one field (white)' do
            p = Pawn.new('c4', :white)
            p.moves(:board).should == ['c5']
          end
          it 'pawn moves one by one field (black)' do
            p = Pawn.new('c4', :black)
            p.moves(:board).should == ['c3']
          end
        end
      end

    end
  end
end
