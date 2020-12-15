# Advent of Code 2020 Day 15
require 'csv'

#Dir.glob("15-sample*") do |filename|
['15-input.txt'].each do |filename|
  p filename
  starting_turns = CSV.read(filename, converters: :numeric)[0]
p "starting numbers: #{starting_turns}"
  past_turns = Hash.new
  turn_number = 1
  last_num_spoken = -1
  while turn_number <= 30000000
    prev_mention = past_turns[last_num_spoken]
    past_turns[last_num_spoken] = turn_number - 1
    if turn_number <= starting_turns.length
      last_num_spoken = starting_turns[turn_number-1]
    elsif !prev_mention 
      last_num_spoken = 0
    else
      last_num_spoken = turn_number - 1 - prev_mention
    end
#p "Turn #{turn_number} = #{last_num_spoken}"
    turn_number += 1
  end
p "Turn #{turn_number-1} = #{last_num_spoken}"
end
