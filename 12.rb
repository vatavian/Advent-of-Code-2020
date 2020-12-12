# Advent of Code 2020 Day 12

new_heading = Hash.new
new_heading['NR90'] = 'E'
new_heading['ER90'] = 'S'
new_heading['SR90'] = 'W'
new_heading['WR90'] = 'N'

new_heading['NR180'] = 'S'
new_heading['ER180'] = 'W'
new_heading['SR180'] = 'N'
new_heading['WR180'] = 'E'

new_heading['NR270'] = 'W'
new_heading['ER270'] = 'N'
new_heading['SR270'] = 'E'
new_heading['WR270'] = 'S'

new_heading['NL90'] = 'W'
new_heading['EL90'] = 'N'
new_heading['SL90'] = 'E'
new_heading['WL90'] = 'S'

new_heading['NL180'] = 'S'
new_heading['EL180'] = 'W'
new_heading['SL180'] = 'N'
new_heading['WL180'] = 'E'

new_heading['NL270'] = 'E'
new_heading['EL270'] = 'S'
new_heading['SL270'] = 'W'
new_heading['WL270'] = 'N'

heading = 'E'
x = 0
y = 0
p 'Start at 0, 0 heading E'
IO.readlines('12-input.txt', chomp: true).each do |instruction|
  direction = instruction[0]
  direction = heading if direction == 'F'
  distance = instruction[1, 9].to_i
  case direction
  when 'N'
    y += distance
  when 'S'
    y -= distance
  when 'E'
    x += distance
  when 'W'
    x -= distance
  when 'L', 'R'
    heading = new_heading[heading + instruction] || p('Did not find new heading for ' + heading + instruction)
  end
  p instruction + " to #{x}, #{y} heading #{heading}"
end

p x, y, x.abs + y.abs