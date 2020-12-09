# Advent of Code 2020 Day 9 part 2

input = []
preamble_length = 25
File.open('9-input.txt') do |infile|
  while line = infile.gets&.chomp
    this_num = line.to_i
    if input.length >= preamble_length
      search_numbers = input.slice(-preamble_length, preamble_length)
#p search_numbers
      is_valid = false
      search_numbers.combination(2).each do |n1, n2|
#p n1.to_s + ' + ' + n2.to_s + ' = ' + (n1+n2).to_s
        if n1+n2 == this_num
          is_valid = true
          break
        end
      end
      if !is_valid
p 'invalid: ' + this_num.to_s
        last_index = input.length - 1
        for start_set in 0..last_index
          sum = input[start_set]
          smallest = sum
          largest = sum
          for end_set in (start_set+1)..last_index
            next_num = input[end_set]
            smallest = next_num if next_num < smallest
            largest = next_num if next_num > largest
            sum += input[end_set]
            if sum == this_num
              p smallest + largest
              return
            elsif sum > this_num
              break
            end
          end
        end
        return
      end
    end
    input.append(this_num)
  end
end
# input = IO.readlines('9-sample1.txt', chomp: true, converters: :numeric)

