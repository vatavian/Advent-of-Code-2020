# Advent of Code 2020 Day 5

#require 'csv'
#CSV.read("5-input.txt")

eye_colors = ['amb', 'blu', 'brn', 'gry', 'grn', 'hzl', 'oth']

def seat_id(bsp)
  max = 127
  min = 0
  half_range = 64
  [0,1,2,3,4,5,6].each do |index|
    if bsp[index] == 'F' 
      max -= half_range
    else
      min += half_range
    end
    #p index, min, max, half_range
    half_range /= 2
  end
  row = min
  
  max = 8
  min = 0
  half_range = 4
  [7,8,9].each do |index|
    if bsp[index] == 'L' 
      max -= half_range
    else
      min += half_range
    end
    #p index, min, max, half_range
    half_range /= 2
  end

  col = min
  id = row * 8 + col

  #p "row #{row} col #{col} id #{id} max #{max}"

  id
end
#p seat_id('FBFBBFFRLR')
#p seat_id('BFFFBBFRRR')
#p seat_id('FFFBBBFRRR')
#p 'Seat ID for BBFFBBFRLL = ' + seat_id('BBFFBBFRLL').to_s
max_id = 0
all_ids = []
File.open('5-input.txt') do |infile|
  while line = infile.gets&.strip
    id = seat_id(line)
    max_id = id if id > max_id
    all_ids.append(id)
  end
end

#p max_id
p all_ids.sort