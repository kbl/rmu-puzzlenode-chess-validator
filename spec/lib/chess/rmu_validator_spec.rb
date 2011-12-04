require 'spec_helper'

module Chess
  describe RmuValidator do

    def path(filename)
       File.join(File.dirname(__FILE__), filename)
    end

    context 'simple_moves' do

      subject { RmuValidator.new(path('simple_board.txt')) }

      it 'should create board from sample file' do
        subject.board.count.should == 32
      end
      it 'should properly validate moves' do
        input = path('simple_moves.txt')
        output = subject.validate(input)
        output.should == %w{
          LEGAL LEGAL ILLEGAL LEGAL
          LEGAL ILLEGAL ILLEGAL LEGAL
          LEGAL ILLEGAL LEGAL ILLEGAL
        }
      end
    end

    context 'complex_moves' do

      subject { RmuValidator.new(path('complex_board.txt')) }

      it 'should print output (;' do
        input = path('complex_moves.txt')
        output = subject.validate(input)
        puts output
      end
    end

  end
end
