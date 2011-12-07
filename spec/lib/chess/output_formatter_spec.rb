require 'spec_helper'

module Chess
  describe OutputFormatter do
    describe 'OutputFormatter.format_output' do
      it 'should properly format output message' do
        validator = RmuValidator.new(path('simple_board.txt'))
        input = path('simple_moves.txt')
        output_stream = StringIO.new

        OutputFormatter.format_output(output_stream, validator.validate(input))

        output_stream.string.should == ''
      end
    end
  end
end
