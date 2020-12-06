# Advent of Code 2020 Day 6

#require 'csv'
#CSV.read("4-input.txt")

#[1, 3, 5, 7].each do |col_incr|
#[1].each do |col_incr|
total_answers = 0
File.open('6-input.txt') do |infile|
  answers = {}
  while line = infile.gets&.strip
    if line.length == 0
      p answers.count
      total_answers += answers.count # if is_valid(pp)
      answers = {}
    else
      line.each_char { |c| answers[c] = true if c.between?('a', 'z') }
    end
  end
  total_answers += answers.count # if is_valid(pp)
end

p "Found #{total_answers} total answers"
