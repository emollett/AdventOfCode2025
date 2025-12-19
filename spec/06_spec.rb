require 'rspec'
require_relative 'spec_helper'
require_relative '../06/main'

describe Day6::Main do
  let(:input) { File.read('./06/input.txt').strip }
  let(:test_input) { File.read('./spec/fixtures/06.txt').strip }

  context 'when using the test data' do
    let(:puzzle) { Day6::Main.new(test_input) }

    it 'splits the input into the problems' do
      expect(puzzle.parsed_input).to eq([["123", "45", "6", "*"], ["328", "64", "98", "+"], ["51", "387", "215", "*"], ["64", "23", "314", "+"]])
    end

    it 'does the maths' do
      puzzle.follow_operation
      expect(puzzle.values[0]).to eq(33210)
      expect(puzzle.values[1]).to eq(490)
    end
  end

  context 'when using the real data' do
    let(:puzzle) { Day6::Main.new(input) }
    it 'returns the answer to part 1' do
      expect(puzzle.part1).to eq(6635273135233)
    end

    # it 'returns the answer to part 2' do
    #   expect(puzzle.part2).to eq
    # end
  end
end
