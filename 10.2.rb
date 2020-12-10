# Advent of Code 2020 Day 10

def next_options(input, options_from, start_index, prev_j, end_index, final_j)
p "next_options #{start_index}"
  valid_options = 0
  valid_options += 1 if final_j - prev_j <= 3 # can end chain successfully without another adapter
  check_index = start_index + 1
  # add valid options starting from each of the next value or two or three that are within 3 units of prev_j
  while check_index <= end_index && (j = input[check_index]) - prev_j <= 3
p check_index.to_s + ': ' + j.to_s
    if options_from[check_index] == -1 # haven't computed next options from there yet
      next_options(input, options_from, check_index, j, end_index, final_j)
    end
    valid_options += options_from[check_index]
    check_index += 1
  end
  options_from[start_index] = valid_options
end

input = IO.readlines('10-input.txt', chomp: true).map(&:to_i).sort
input.prepend(0)
final_j = input[-1] + 3 # built-in adapter

options_from = Array.new(input.length, -1)
p next_options(input, options_from, 0, 0, input.length-1, final_j)
p options_from


