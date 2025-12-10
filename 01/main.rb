module Day1
  class Main
    attr_accessor :parsed_input, :dial, :zeros, :current_position, :zeros_from_clicks

    def initialize(input)
      @parsed_input = input.lines.map(&:chomp)
      @dial = [*0..99]
      @zeros = 0
      @zeros_from_clicks = 0
      @current_position = 50
    end

    def split_instruction(instruction)
      [instruction[0], instruction[1..].to_i]
    end

    def move_dial(instruction)
      direction = split_instruction(instruction)[0]
      moves = split_instruction(instruction)[1]

      times_past_zero(@current_position, moves, direction)

      new_position = if direction == 'R'
                       @zeros_from_clicks += (@current_position + moves - 1) / 100
                       dial[(@current_position + moves) % 100]
                     else
                       if (@current_position - moves).negative? && @current_position != 0 && @current_position > -100
                         @zeros_from_clicks += 1
                       end
                       @zeros_from_clicks += ((@current_position - moves).abs / 100)
                       dial[(@current_position - moves) % 100]
                     end

      @current_position = new_position.to_i
      @zeros += 1 if @current_position.zero?
    end

    def times_past_zero(current_position, moves, direction)
      passes = 0
      if direction == 'R'
        passes += (current_position + moves - 1) / 100
      else
        passes += 1 if (current_position - moves).negative?
        puts passes
        passes += ((current_position - moves).abs / 100)
        puts passes
        puts current_position
        passes -= 1 if current_position.zero?
        puts passes
      end
      passes
    end

    def follow_instructions
      @parsed_input.each do |instruction|
        move_dial(instruction)
      end
    end

    def part1
      follow_instructions
      @zeros
    end

    def part2
      follow_instructions
      puts @zeros
      puts @zeros_from_clicks
      @zeros + @zeros_from_clicks
    end
  end
end
