require 'rspec'
require_relative 'spec_helper'
require_relative '../template/main'

describe Day1::Main do
  let(:input) { File.read('./0X/input.txt').strip }
  let(:test_input) { File.read('./spec/fixtures/0X.txt').strip }

  context 'when using the test data' do
    let(:puzzle) { DayX::Main.new(test_input) }
  end

  context 'when using the real data' do
    let(:puzzle) { DayX::Main.new(input) }
    it 'returns the answer to part 1' do
      expect(puzzle.part1).to eq
    end

    it 'returns the answer to part 2' do
      expect(puzzle.part2).to eq
    end
  end
end
