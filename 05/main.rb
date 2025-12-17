module Day5
  class Main
    attr_accessor :parsed_input, :fresh_ids, :fresh_ingredients, :count

    def initialize(input)
      @parsed_input = input.split("\n\n").map { |i| i.split("\n") }
      @fresh_ids = []
      generate_fresh_ids
      @fresh_ingredients = []
      @count = 0
    end

    def generate_fresh_ids
      fresh_id_ranges = @parsed_input[0]
      fresh_id_ranges.each do |id_range|
        range = id_range.split('-').map(&:to_i)
        @fresh_ids.push(range)
        @fresh_ids = @fresh_ids.uniq
      end
    end

    def check_ingredients
      ingredients = @parsed_input[1]
      ingredients.each do |ingredient|
        @fresh_ids.each do |range|
           if ingredient.to_i >= range[0] && ingredient.to_i <= range[1]
            @fresh_ingredients.push(ingredient.to_i) 
            @count += 1
            break
           end
        end
      end
    end

    def part1
      check_ingredients
    end

    # def part2

    # end
  end
end
