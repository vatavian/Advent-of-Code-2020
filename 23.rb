# Advent of Code 2020 Day 23 part 1 - Crab Cups

p cups = [4,7,6,1,3,8,2,5,9] # sample [3,8,9,1,2,5,4,6,7]
@max_cup = cups.max
@min_cup = cups.min

def move(cups)
puts "cups: #{cups}"
  current_cup = cups[0]
  move_cups = cups[1, 3]

puts "pick up: #{move_cups}"
  
  destination_val = current_cup - 1
  destination_val = @max_cup if destination_val < @min_cup

  while move_cups.include?(destination_val)
    destination_val -= 1
    destination_val = @max_cup if destination_val < @min_cup
  end
puts "destination: #{destination_val}"
  cups.delete_at(1)
  cups.delete_at(1)
  cups.delete_at(1)
  insert_after = cups.index(destination_val)
p "Insert after index: #{insert_after}"
  cups.insert(insert_after+1, move_cups[0], move_cups[1], move_cups[2])
  cups.rotate(1)
end

(1..100).each { |move| p "-- move #{move}"; cups = move cups}

p cups