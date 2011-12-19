require 'spec_helper'

module Chess
  describe OutputFormatter do
    describe 'OutputFormatter.format_output' do
      it 'should properly format output message' do
        output = ''
        File.open(path('simple_results.txt')) do |file|
          file.each { |line| output << line }
        end

        validator = RmuValidator.new(path('simple_board.txt'))
        input = path('simple_moves.txt')
        output_stream = StringIO.new

        OutputFormatter.format_output(output_stream, validator.validate(input))

        output_stream.string.should == output
      end
      it 'should pass puzzlenode (:' do
        validator = RmuValidator.new(path('complex_board.txt'))
        input = path('complex_moves.txt')

        file = File.new('complex_results.txt', 'w')
        OutputFormatter.format_output(file, validator.validate(input))
        file.close
      end
    end
  end
end
