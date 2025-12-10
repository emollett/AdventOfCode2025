module Day2
  class Main
    attr_accessor :parsed_input, :invalids, :new_invalids

    def initialize(input)
      @parsed_input = input.split(',')
      @invalids = []
      @new_invalids = []
    end

    def find_invalids
      @parsed_input.each do |range|
        find_invalid(range)
        find_new_invalid(range)
      end
    end

    def find_invalid(range)
      bottom, top = range.split('-')

      (bottom.to_i..top.to_i).each do |i|
        id = i.to_s
        next unless id.length.even?

        first, second = id.chars.each_slice(id.length / 2).map(&:join)
        @invalids.push(i) if first == second
      end
    end

    def find_new_invalid(range)
      bottom, top = range.split('-')

      (bottom.to_i..top.to_i).each do |i|
        id = i.to_s

        @new_invalids.push(id.to_i) if id =~ /^(.+)\1+$/
      end
    end

    def part1
      find_invalids
      @invalids.sum
    end

    def part2
      find_invalids
      @new_invalids.sum
    end
  end
end
