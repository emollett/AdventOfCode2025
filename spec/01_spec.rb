require 'rspec'
require_relative 'spec_helper'
require_relative '../01/main'

describe Day1::Main do
  let(:input) { File.read('./01/input.txt').strip }
  let(:test_input) { File.read('./spec/fixtures/01.txt').strip }

  context 'when using the test data' do
    let(:puzzle) { Day1::Main.new(test_input) }

    it 'initializes a dial I can access how I expect' do
      expect(puzzle.dial[1]).to eq(1)
      expect(puzzle.dial[-1]).to eq(99)
    end

    # it 'moves the dial by the instruction' do
    #   puzzle.move_dial(puzzle.parsed_input[0])
    #   expect(puzzle.current_position).to eq(82)
    #   # tests moving negatively past 0
    #   expect(puzzle.zeros_from_clicks).to eq(1)

    #   puzzle.move_dial(puzzle.parsed_input[1])
    #   expect(puzzle.current_position).to eq(52)
    #   # tests moving negatively not past 0
    #   expect(puzzle.zeros_from_clicks).to eq(1)

    #   puzzle.move_dial(puzzle.parsed_input[2])
    #   expect(puzzle.current_position).to eq(0)
    #   # tests moving positively and hitting 0
    #   expect(puzzle.zeros_from_clicks).to eq(1)

    #   puzzle.move_dial(puzzle.parsed_input[3])
    #   # tests moving negatively away from 0
    #   expect(puzzle.zeros_from_clicks).to eq(1)

    #   puzzle.move_dial(puzzle.parsed_input[4])
    #   # tests moving positively past 0
    #   expect(puzzle.zeros_from_clicks).to eq(2)

    #   puzzle.move_dial(puzzle.parsed_input[5])
    #   # tests moving negatively and hitting 0
    #   expect(puzzle.zeros_from_clicks).to eq(2)

    #   # puzzle.move_dial(puzzle.parsed_input[10])
    #   # # tests moving masively positively and landing on 0
    #   # expect(puzzle.zeros_from_clicks).to eq(11)

    #   # puzzle.move_dial(puzzle.parsed_input[11])
    #   # # tests moving masively negatively and landing on 0
    #   # expect(puzzle.zeros_from_clicks).to eq(21)
    #   # expect(puzzle.current_position).to eq(0)
    # end
    #

    # it 'increments when you pass 0' do
    #   expect(puzzle.times_past_zero(99, 2, 'R')).to eq(1)
    #   expect(puzzle.times_past_zero(99, 102, 'R')).to eq(2)
    #   expect(puzzle.times_past_zero(1, 2, 'L')).to eq(1)
    #   expect(puzzle.times_past_zero(1, 102, 'L')).to eq(2)
    # end

    it 'doesnt increment when you land on 0 but does when you pass it' do
      # expect(puzzle.times_past_zero(99, 1, 'R')).to eq(0)
      # expect(puzzle.times_past_zero(99, 101, 'R')).to eq(1)
      # expect(puzzle.times_past_zero(1, 1, 'L')).to eq(0)
      expect(puzzle.times_past_zero(1, 101, 'L')).to eq(1)
    end
  end

  # context 'test full run' do
  #   let(:puzzle) { Day1::Main.new(test_input) }

  #   it 'increments each time you hit 0' do
  #     puzzle.follow_instructions
  #     expect(puzzle.zeros).to eq(3)
  #   end
  # end

  # context 'test second part full run' do
  #   let(:puzzle) { Day1::Main.new(test_input) }
  #   it 'counts both types of zeros' do
  #     puzzle.follow_instructions
  #     expect(puzzle.zeros + puzzle.zeros_from_clicks).to eq(6)
  #   end
  # end

  # context 'when using the real data' do
  #   let(:puzzle) { Day1::Main.new(input) }
  #   it 'returns the answer to part 1' do
  #     expect(puzzle.part1).to eq(1141)
  #   end
  # end

  # context 'when using the real data part 2' do
  #   let(:puzzle) { Day1::Main.new(input) }

  #   it 'returns the answer to part 2' do
  #     expect(puzzle.part2).to eq(0)
  #   end
  # end
end
