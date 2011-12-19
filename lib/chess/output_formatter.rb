module Chess
  module OutputFormatter

    LEGAL = 'LEGAL'
    ILLEGAL = 'ILLEGAL'

    def self.format_output(stream, output)
      output.each { |validation_result| stream.puts(validation_result ? LEGAL : ILLEGAL) }
    end

  end
end
