require 'spec_helper'

module Chess
  describe Board do

    subject { Board.new }

    describe 'Board#[]' do
      it 'should be possible to access board by cords' do
        p = Chessman::Pawn.new('a1', :white)                                                                                                      
        subject << p

        subject[1, 1].should == p
        subject.position('a1').should == p
      end
    end
  end
end
