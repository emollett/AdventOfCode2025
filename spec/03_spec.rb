require 'rspec'
require_relative 'spec_helper'
require_relative '../03/main'

describe Day3::Main do
  let(:input) { File.read('./03/input.txt').strip }
  let(:test_input) { File.read('./spec/fixtures/03.txt').strip }

  context 'when using the test data' do
    let(:puzzle) { Day3::Main.new(test_input, 2) }

    it 'splits the bank how I expect it to' do
      expect(puzzle.split_battery_bank('987654321111111')).to eq([9, 8, 7, 6, 5, 4, 3, 2, 1, 1, 1, 1, 1, 1, 1])
    end

    it 'finds the largest joltage in a bank' do
      expect(puzzle.find_biggest_joltage([9, 8, 7, 6, 5, 4, 3, 2, 1, 1, 1, 1, 1, 1, 1])).to eq(98)
    end

    it 'finds the largest joltages for each bank' do
      puzzle.find_biggest_joltages
      expect(puzzle.joltages).to eq([98, 89, 78, 92])
    end

    it 'sums the joltages' do
      puzzle.find_biggest_joltages
      expect(puzzle.total_output).to eq(357)
    end
  end

  context 'when using test data for part 2 where you need 12 batteries' do
    let(:puzzle) { Day3::Main.new(test_input, 12) }
    it 'finds the largest joltage in a bank' do
      expect(puzzle.find_biggest_joltage([9, 8, 7, 6, 5, 4, 3, 2, 1, 1, 1, 1, 1, 1, 1])).to eq(987_654_321_111)
      expect(puzzle.find_biggest_joltage([2, 3, 4, 2, 3, 4, 2, 3, 4, 2, 3, 4, 2, 7, 8])).to eq(434_234_234_278)
    end

    it 'finds the largest joltages for each bank' do
      puzzle.find_biggest_joltages
      expect(puzzle.joltages).to eq([987_654_321_111, 811_111_111_119, 434_234_234_278, 888_911_112_111])
    end

    it 'sums the joltages' do
      puzzle.find_biggest_joltages
      expect(puzzle.total_output).to eq(3_121_910_778_619)
    end
  end

  context 'when using the real data' do
    let(:puzzle) { Day3::Main.new(input, 2) }
    it 'returns the answer to part 1' do
      expect(puzzle.part1).to eq(17_281)
    end
  end

  context 'when using the real data' do
    let(:puzzle) { Day3::Main.new(input, 12) }

    it 'returns the answer to part 2' do
      expect(puzzle.part2).to eq(171_388_730_430_281)
    end
  end
end
