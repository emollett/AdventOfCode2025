module Day3
  class Main
    attr_accessor :parsed_input, :joltages

    def initialize(input, battery_length)
      @parsed_input = input.lines.map(&:chomp)
      @joltages = []
      @battery_length = battery_length
    end

    def split_battery_bank(bank)
      bank.chars.map(&:to_i)
    end

    def find_biggest_joltages
      @parsed_input.each do |bank|
        bank = split_battery_bank(bank)
        @joltages.push(find_biggest_joltage(bank))
      end
    end

    def find_biggest_joltage(bank)
      battery = []
      first = bank[0..-@battery_length].max
      battery.push(first)
      last_biggest = first
      while battery.length < @battery_length
        bank = bank[(bank.find_index(last_biggest) + 1)..-1]
        next_biggest = bank[0..-(@battery_length - battery.length)].max
        battery.push(next_biggest)
        last_biggest = next_biggest
      end
      battery.join.to_i
    end

    def total_output
      @joltages.sum
    end

    def part1
      find_biggest_joltages
      total_output
    end

    def part2
      find_biggest_joltages
      total_output
    end
  end
end
