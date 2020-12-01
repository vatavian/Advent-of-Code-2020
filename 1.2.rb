# Advent of Code 2020 Day 1 part 2

def find_two_that_total(all, total)
  all.each do |entry1|
    all.each do |entry2|
      if entry1 + entry2 == total
        return entry1, entry2
      end
    end
  end
end

# It is big-oh n-cubed, but good enough to get the right answer for AoC
def find_three_that_total(all, total)
  all.each do |entry1|
    all.each do |entry2|
      all.each do |entry3|
        if entry1 + entry2 + entry3 == total
          return entry1, entry2, entry3
        end
      end
    end
  end
end

all = [1721, 979, 366,299,675,1456]
e1, e2, e3 = find_three_that_total(all, 2020)
p 'test answer: ' + (e1 * e2 * e3).to_s

all = []
File.open('1-input.txt') do |infile|
  while line = infile.gets
    all.append line.chomp.to_i
  end
end

e1, e2, e3 = find_three_that_total(all, 2020)
p 'input file answer: ' + (e1 * e2 * e3).to_s
