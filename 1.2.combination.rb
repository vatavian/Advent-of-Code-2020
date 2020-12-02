# Advent of Code 2020 Day 1 part 2

# More elegant and efficient to use Ruby's combination and sum methods
# Probably also more correct since it does not reuse the same number like my first solution

def find_two_that_total(all, total)
  all.combination(2).each do |e1, e2|
    if e1 + e2 == total
      return e1, e2
    end
  end
end

def find_three_that_total(all, total)
  all.combination(3).each do |e1, e2, e3|
    if e1 + e2 + e3 == total
      return e1, e2, e3
    end
  end
end

# After doing separate methods for finding two and three, I realized a general version would be better.
def find_n_that_total(all, total, n)
  all.combination(n).each do |combo|
    if combo.sum == total
      # p combo
      return combo
    end
  end
end

all = [1721, 979, 366, 299, 675, 1456]
e1, e2 = find_n_that_total(all, 2020, 2)
p 'test answer part 1 (multiply together the two that sum to 2020): ' + (e1 * e2).to_s
e1, e2, e3 = find_n_that_total(all, 2020, 3)
p 'test answer part 2 (multiply together the three that sum to 2020): ' + (e1 * e2 * e3).to_s

all = []
File.open('1-input.txt') do |infile|
  while line = infile.gets
    all.append line.chomp.to_i
  end
end
p 'input file answers'
e1, e2 = find_n_that_total(all, 2020, 2)
p 'part 1 answer: ' + e1.to_s + ' * ' + e2.to_s + ' = ' + (e1 * e2).to_s

e1, e2, e3 = find_n_that_total(all, 2020, 3)
p 'part 2 answer: ' + e1.to_s + ' * ' + e2.to_s + ' * ' + e3.to_s + ' = ' + (e1 * e2 * e3).to_s


