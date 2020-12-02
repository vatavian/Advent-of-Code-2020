# Advent of Code 2020 Day 2 part 1

def is_valid?(line)
  rule, pw = line.split(':')
  range, letter = rule.split(' ')
  min, max = range.split('-')
  min = min.to_i
  max = max.to_i
  count = pw.count(letter)
  return count >= min && count <= max
end

num_valid = 0
File.open('2-input.txt') do |infile|
  while line = infile.gets&.chomp
    num_valid += 1 if is_valid? line
  end
end
p num_valid

