require 'spec_helper'

module Chess
  module Chessman
    describe Base do
      it 'should properly interpret position' do
        chessman = Base.new('a1')

        chessman.x.should == 1
        chessman.y.should == 1
      end
      it 'should understand upcased position' do
        chessman = Base.new('H8')

        chessman.x.should == 8
        chessman.y.should == 8
      end
      it 'should raise error on invalid position' do
        lambda { Base.new('A9') }.should raise_error
      end
    end
  end
end
