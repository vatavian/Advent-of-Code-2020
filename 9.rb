# Advent of Code 2020 Day 9

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
        p this_num
        return
      end
    end
    input.append(this_num)
  end
end
# input = IO.readlines('9-sample1.txt', chomp: true, converters: :numeric)

