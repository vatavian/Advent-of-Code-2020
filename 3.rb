# Advent of Code 2020 Day 3

#[1, 3, 5, 7].each do |col_incr|
[1].each do |col_incr|
rows = 0
column = 0
trees = 0
skip = true
File.open('3-input.txt') do |infile|
  while line = infile.gets&.chomp
    rows += 1
    if rows == 1
    elsif skip
      skip = false
    else
      column += col_incr
      column -= line.length if column >= line.length
      #p rows.to_s + " line " + line + " [" + column.to_s + "] = " + line[column]
      trees += 1 if line[column] == '#'
      skip = true
    end
  end
end
# wrong answer: 2969694000
p " for cols += " + col_incr.to_s + ', ' + trees.to_s + ' trees.'
end
p 84 * 195 * 70 * 70 * 47
