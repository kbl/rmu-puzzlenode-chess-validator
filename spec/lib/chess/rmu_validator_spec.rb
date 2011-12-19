require 'spec_helper'

module Chess
  describe RmuValidator do

    context 'simple_moves' do

      subject { RmuValidator.new(path('simple_board.txt')) }

      it 'should create board from sample file' do
        subject.board.count.should == 32
      end
      it 'should properly validate moves' do
        input = path('simple_moves.txt')
        output = subject.validate(input)
        output.should == [
          true, true, false, true,
          true, false, false, true,
          true, false, true, false
        ]
      end
    end

  end
end
