# Advent of Code 2020 Day 13
require 'csv'

File.open('13-input.txt') do |infile|
  min_wait = 9999999
  earliest = infile.gets.strip.to_i
  buses = CSV.parse(infile.gets.strip, converters: :numeric)[0]
  buses.each do |bus|
    if bus != 'x'
      div, mod = earliest.divmod(bus)
      if mod == 0 
        p "Exact arrival time: #{bus} * #{div} == #{earliest}"
      else
        wait = bus * (div + 1) - earliest
        if wait < min_wait
          p "Wait for #{bus} = #{wait} (* id = #{wait * bus})"
          min_wait = wait
        end
      end
    end
  end
end
