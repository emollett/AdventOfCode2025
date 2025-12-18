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

    def sort_ranges
      @fresh_ids.sort{ |a,b| a[0] <=> b[0]}
    end

    def combine_ranges
      sorted_ranges = sort_ranges
      i = 0
      range_start = sorted_ranges[0][0]
      range_end = sorted_ranges[0][1]
      combined_ranges = []
      until i == (sorted_ranges.length-1) do
        if sorted_ranges[i][1] >= sorted_ranges[i+1][0]
          if sorted_ranges[i+1][1] > range_end
            range_end = sorted_ranges[i+1][1]
          end
        else
          combined_ranges.push([range_start, range_end])
          range_start = sorted_ranges[i+1][0] 
          range_end = sorted_ranges[i+1][1]
        end
        i += 1
      end
      combined_ranges.push([range_start, range_end])
      combined_ranges
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

    def count_fresh
      combined_ranges = combine_ranges
      fresh = 0
      combined_ranges.each do |range|
        fresh += ((range[1] - range[0]) + 1)
      end
      fresh
    end

    def part1
      check_ingredients
    end

    def part2
      count_fresh
    end
  end
end
