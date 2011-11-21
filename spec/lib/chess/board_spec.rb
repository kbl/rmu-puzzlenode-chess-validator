require 'spec_helper'

module Chess
  describe Board do

    subject { Board.new }

    describe 'Board#[]' do
      it 'should be possible to access board by cords' do
        p = Chessman::Pawn.new('a1', :white)                                                                                                      
        subject << p

        subject[1, 1].should == p
        subject.field('a1').should == p
      end
      it 'should raise error on wrong cords' do
        lambda { subject[0, 8] }.should raise_error
        lambda { subject[1, 0] }.should raise_error
        lambda { subject[9, 1] }.should raise_error
        lambda { subject[1, 9] }.should raise_error
      end
      it 'should raise error on wrong position' do
        lambda { subject.position('J1') }.should raise_error
        lambda { subject.position('a0') }.should raise_error
        lambda { subject.position('A9') }.should raise_error
      end
    end
  end
end
