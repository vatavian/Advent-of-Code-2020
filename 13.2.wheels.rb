# Advent of Code 2020 Day 13 part 2
require 'csv'

#['13-sample.txt', '13-sample2.txt', '13-sample3.txt', '13-sample4.txt', '13-sample5.txt', '13-sample6.txt'].each do |filename| #, '13-input.txt'
['13-input.txt'].each do |filename|
p filename

buses_a = CSV.read(filename)[1].map{|bus| bus == 'x' ? 0 : bus.to_i}

max_bus, max_index = buses_a.each_with_index.max

buses_h1 = Hash.new
buses_a.each_with_index { |value, index| buses_h1[index] = value if value > 0 }
buses = buses_h1.sort_by {|k,v| v}.reverse

p buses

p "Max bus was not first in buses!" if buses[0][1] != max_bus

start_clock = Process.clock_gettime(Process::CLOCK_MONOTONIC)

time = max_bus - max_index #Interrupted at: 410,045,223,992,365 # 400014688125191 #11521664234111 #max_bus - max_index

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

times_considered = 0
total_modulus = max_bus
buses.shift # remove max bus from list, we know it will be starting at the right time from now on

loop do
  if buses.length == 0
    p "------------------------------>Answer time: #{time}"
    p "Considered a total of #{times_considered} different times"
    break
  else
    if (time + buses[0][0]) % buses[0][1] == 0
#p "Time #{time.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse} satisfies bus #{buses[0]}"
      total_modulus *= buses[0][1]
#p "Total modulus now #{total_modulus}"
      buses.shift # remove this bus from the list
#p "Buses now #{buses}"
    else
      time += total_modulus
      times_considered += 1
    end
  end
end

end # loop over filenames