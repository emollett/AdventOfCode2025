require 'rspec'
require_relative 'spec_helper'
require_relative '../05/main'

describe Day5::Main do
  let(:input) { File.read('./05/input.txt').strip }
  let(:test_input) { File.read('./spec/fixtures/05.txt').strip }

  context 'when using the test data' do
    let(:puzzle) { Day5::Main.new(test_input) }

    it 'parses the input how I want it' do
      expect(puzzle.parsed_input).to eq([%w[3-5 10-14 16-20 12-18], %w[1 5 8 11 17 32]])
    end

    it 'gets the ranges how I want them' do
      expect(puzzle.fresh_ids).to eq([[3, 5], [10, 14], [16, 20], [12, 18]])
    end

    it 'checks the ingredients to see if they are fresh' do
      puzzle.check_ingredients
      expect(puzzle.fresh_ingredients).to eq([5, 11, 17])
    end
  end

  context 'when using the real data' do
    let(:puzzle) { Day5::Main.new(input) }
    it 'returns the answer to part 1' do
      puzzle.part1
      expect(puzzle.count).to eq(821)
    end

    # it 'returns the answer to part 2' do
    #   expect(puzzle.part2).to eq
    # end
  end
end
