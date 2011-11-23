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
      it 'should be possible to access board by cords #2' do
        p = Chessman::Pawn.new('C4', :white)                                                                                                      
        subject << p

        subject[3, 4].should == p
        subject.field('c4').should == p
      end
      it 'should raise error on wrong cords' do
        lambda { subject[0, 8] }.should raise_error(RuntimeError, 'illegal argument')
        lambda { subject[1, 0] }.should raise_error(RuntimeError, 'illegal argument')
        lambda { subject[9, 1] }.should raise_error(RuntimeError, 'illegal argument')
        lambda { subject[1, 9] }.should raise_error(RuntimeError, 'illegal argument')
      end
      it 'should raise error on wrong position' do
        lambda { subject.field('J1') }.should raise_error(RuntimeError, 'illegal field argument')
        lambda { subject.field('a0') }.should raise_error(RuntimeError, 'illegal field argument')
        lambda { subject.field('A9') }.should raise_error(RuntimeError, 'illegal field argument')
      end
      context 'corners' do
        it 'should be possible to access bottom left corner' do
          subject << p = Chessman::Pawn.white('a1')

          subject[1, 1].should == p
          subject.field('a1').should == p
        end
        it 'should be possible to access upper left corner' do
          subject << p = Chessman::Pawn.white('a8')
          
          subject[1, 8].should == p
          subject.field('a8').should == p
        end
        it 'should be possible to access bottom right corner' do
          subject << p = Chessman::Pawn.white('h1')

          subject[8, 1].should == p
          subject.field('h1').should == p
        end
        it 'should be possible to access upper right corner' do
          subject << p = Chessman::Pawn.white('h8')

          subject[8, 8].should == p
          subject.field('h8').should == p
        end
      end
    end
  end
end
