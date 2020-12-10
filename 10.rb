# Advent of Code 2020 Day 10

input = IO.readlines('10-input.txt', chomp: true).map(&:to_i).sort
input.append(input[-1] + 3) # Add built-in adapter
p input
prev_j = 0
differences = Hash.new(default = 0)
input.each do |j|
  difference = j - prev_j
  differences[difference] += 1
  prev_j = j
end
p differences
