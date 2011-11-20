require 'spec_helper'

module Chess
  module Chessman
    describe Base do
      describe 'Base#initialize' do
        it 'should properly interpret position' do
          chessman = Base.new('a1', :white)

          chessman.x.should == 1
          chessman.y.should == 1
        end
        it 'should understand upcased position' do
          chessman = Base.new('H8', :white)

          chessman.x.should == 8
          chessman.y.should == 8
        end
        it 'should raise error on invalid position' do
          lambda { Base.new('A9', :white) }.should raise_error
        end
        it 'should have color property' do
          Base.new('a1', :black).color.should == :black
        end
        it 'should raise error on bad color argument' do
          lambda { Base.new('A1', :red) }.should raise_error
        end
      end

      describe 'Base#position_in_notation' do
        it 'should create position in notation from numbers' do
          Base.position(1, 1).should == 'a1'
        end
        it 'should raise error for wrong args' do
          lambda { Base.position(1, 9) }.should raise_error
          lambda { Base.position(9, 1) }.should raise_error
          lambda { Base.position(0, 1) }.should raise_error
          lambda { Base.position(1, 0) }.should raise_error
        end
      end
    end
  end
end
