module Day6
  class Main
    attr_accessor :parsed_input, :values

    def initialize(input)
      @parsed_input = input.lines.map{|l| l.split.map(&:chomp)}.transpose
      @values = []
    end

    def follow_operation
      @parsed_input.each do |problem|
        numbers = problem[0..-2].map(&:to_i)
        if problem[-1] == '*'
          values.push(numbers.reduce(:*))
        end
        if problem[-1] == '+'
          values.push(numbers.sum)
        end
      end
    end

    def part1
      follow_operation
      values.sum
    end

    # def part2

    # end
  end
end
