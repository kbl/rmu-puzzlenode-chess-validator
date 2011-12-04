module Chess
  module Parser
    class InputParser

      def initialize(file)
        @file = file
      end

      def each
        @file.each_line do |line|
          yield line.split
        end
      end

    end
  end
end
