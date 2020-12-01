# Advent of Code 2020 Day 1

def find_two_that_total(all, total)
  all.each do |entry1|
    all.each do |entry2|
      if entry1 + entry2 == total
        return entry1, entry2
      end
    end
  end
end

all = [1721, 979, 366,299,675,1456]
e1, e2 = find_two_that_total(all, 2020)
p e1 * e2
#all.each do |entry1|
#  all.each do |entry2|
#    if entry1 + entry2 == 2020
#      p entry1 * entry2
#    end
#  end
#end

all = []
File.open('1-input.txt') do |infile|
  while line = infile.gets
    all.append line.chomp.to_i
#    num_modules += 1
  end
end

e1, e2 = find_two_that_total(all, 2020)
p e1 * e2
#all.each do |entry1|
#  all.each do |entry2|
#    if entry1 + entry2 == 2020
#      p entry1 * entry2
#    end
#  end
#end

#p 'Total ' + num_modules.to_s + ' modules is ' + total_fuel_needed.to_s