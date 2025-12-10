require 'rspec'
require_relative 'spec_helper'
require_relative '../02/main'

describe Day2::Main do
  let(:input) { File.read('./02/input.txt').strip }
  let(:test_input) { File.read('./spec/fixtures/02.txt').strip }

  context 'when feeding my own data' do
    let(:puzzle) { Day2::Main.new(test_input) }

    it 'finds invalid ids in a range' do
      puzzle.find_invalid('11-22')
      expect(puzzle.invalids).to eq([11, 22])
    end
  end

  context 'when using the test data' do
    let(:puzzle) { Day2::Main.new(test_input) }

    it 'finds all invalid ids' do
      puzzle.find_invalids
      expect(puzzle.invalids).to eq([11, 22, 99, 1010, 1_188_511_885, 222_222, 446_446, 38_593_859])
    end

    it 'adds up all the invalid ids' do
      expect(puzzle.part1).to eq(1_227_775_554)
    end
  end

  context 'when using the new rules' do
    let(:puzzle) { Day2::Main.new(test_input) }

    it 'finds invalid ids in a range' do
      puzzle.find_new_invalid('998-1012')
      expect(puzzle.new_invalids).to eq([999, 1010])
    end
  end

  context 'when using the real data' do
    let(:puzzle) { Day2::Main.new(input) }
    it 'returns the answer to part 1' do
      expect(puzzle.part1).to eq(19_605_500_130)
    end

    it 'returns the answer to part 2' do
      expect(puzzle.part2).to eq(0)
    end
  end
end
