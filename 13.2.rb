# Advent of Code 2020 Day 13 part 2
require 'csv'

# Will take as input a time in seconds (which is typically a result after subtracting two Time objects),
# and return the result in HH:MM:SS, even if it exceeds a 24 hour period.
def formatted_duration(total_seconds)
  total_seconds = total_seconds.round # to avoid fractional seconds potentially compounding and messing up seconds, minutes and hours
  hours = total_seconds / (60*60)
  minutes = (total_seconds / 60) % 60 # the modulo operator (%) gives the remainder when leftside is divided by rightside. Ex: 121 % 60 = 1
  seconds = total_seconds % 60
  [hours, minutes, seconds].map do |t|
    # Right justify and pad with 0 until length is 2. 
    # So if the duration of any of the time components is 0, then it will display as 00
    t.round.to_s.rjust(2,'0')
  end.join(':')
end

buses = CSV.read('13-input.txt')[1].map{|bus| bus == 'x' ? 0 : bus.to_i}
max_bus, max_index = buses.each_with_index.max

start_clock = Process.clock_gettime(Process::CLOCK_MONOTONIC)

time = 2761663971311 # max_bus - max_index
last_time = 0
next_print = 0
begin

loop do
  all_pass = true
  buses.each_with_index do |bus, index|
    if bus != 0 && (time + index) % bus != 0
      all_pass = false
      break
    end
  end
  if all_pass
    p "Answer time: #{time}"
    break
  end
  if time >= next_print
    p "Not found yet: #{time.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse} #{formatted_duration(Process.clock_gettime(Process::CLOCK_MONOTONIC) - start_clock)}"
    next_print = time + 10000000000
  end
  time += max_bus
end

rescue Interrupt => e
  puts "Interrupted at: #{time.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse} #{formatted_duration(Process.clock_gettime(Process::CLOCK_MONOTONIC) - start_clock)}"
end