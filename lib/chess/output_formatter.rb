module Chess
  module OutputFormatter

    def self.format_output(stream, output)
      output.each { |validation_result| stream.puts(validation_result) }
    end

  end
end
