require 'spec_helper'

module Chess
  module Chessman
    describe Pawn do

      subject { Pawn.new('a2', :white) }

      it 'should return posible movements' do
        pending
        subject.moves.should == ['a3', 'a4']
      end

    end
  end
end
