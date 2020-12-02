# Advent of Code 2020 Day 2 part 2

def is_valid?(line)
  rule, pw = line.split(':')
  range, letter = rule.split(' ')
  min, max = range.split('-')
  min = min.to_i
  max = max.to_i
  return (pw[min] == letter || pw[max] == letter) && (pw[min] != letter || pw[max] != letter)
end

num_valid = 0
File.open('2-input.txt') do |infile|
  while line = infile.gets&.chomp
    num_valid += 1 if is_valid? line
  end
end
p num_valid

