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

#['13-sample.txt', '13-sample2.txt', '13-sample3.txt', '13-sample4.txt', '13-sample5.txt', '13-sample6.txt'].each do |filename| #, '13-input.txt'
['13-input.txt'].each do |filename|
p filename

buses_a = CSV.read(filename)[1].map{|bus| bus == 'x' ? 0 : bus.to_i}

max_bus, max_index = buses_a.each_with_index.max

buses_h1 = Hash.new
buses_a.each_with_index { |value, index| buses_h1[index] = value if value > 0 }
buses = buses_h1.sort_by {|k,v| v}.reverse

start_clock = Process.clock_gettime(Process::CLOCK_MONOTONIC)

time = 100000000000000 #11521664234111 #max_bus - max_index

max_remainder = (time + max_index) % max_bus
if max_remainder != 0
  p "Start time #{time.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse} not a good one for maximum time period bus."
  time -= max_remainder
  p "Starting at #{time.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse}"
  max_remainder = (time + max_index) % max_bus
  if max_remainder != 0
    p "Skipping forward did not work!"
    return
  end
end

next_print = 0
begin

loop do
  all_pass = true
  buses.each do |index, bus|
    if (time + index) % bus != 0
      all_pass = false
      break
    end
  end
  if all_pass
    p "------------------------------>Answer time: #{time}"
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

end