require 'spec_helper'

module Chess
  describe RmuValidator do
    it 'should create board from sample file' do
      path = File.join(File.dirname(__FILE__), 'simple_board.txt')
      v = RmuValidator.new(path)
      v.board.count.should == 32
    end
  end
end
