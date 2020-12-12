# Advent of Code 2020 Day 12 part 2, moving the waypoint

x = 0
y = 0

wx = 10
wy = 1

p "Start at #{x}, #{y}, waypoint #{wx}, #{wy}"
IO.readlines('12-input.txt', chomp: true).each do |instruction|
  direction = instruction[0]
  distance = instruction[1, 9].to_i
  case direction
  when 'N'
    wy += distance
  when 'S'
    wy -= distance
  when 'E'
    wx += distance
  when 'W'
    wx -= distance
  when 'L'
    while distance > 0
      new_wx = -wy
      wy = wx
      wx = new_wx
      distance -= 90
    end
  when 'R'
    while distance > 0
      new_wx = wy
      wy = -wx
      wx = new_wx  
      distance -= 90
    end
  when 'F'
    x += wx * distance
    y += wy * distance
  end
  p instruction + " to #{x}, #{y}, waypoint #{wx}, #{wy}"
end

p x, y, x.abs + y.abs