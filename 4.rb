# Advent of Code 2020 Day 4

#require 'csv'
#CSV.read("4-input.txt")

eye_colors = ['amb', 'blu', 'brn', 'gry', 'grn', 'hzl', 'oth']

def is_valid(pp)
  /[0-9]{4}/ =~ pp['byr'] && byr = pp['byr'].to_i && byr >= 1920 && byr <= 2002
end

#[1, 3, 5, 7].each do |col_incr|
#[1].each do |col_incr|
valid_pps = 0
File.open('4-input.txt') do |infile|
  pp = { 'byr': false, 'iyr': false, 'eyr': false, 'hgt': false, 'hcl': false, 'ecl': false, 'pid': false, 'cid': false}
  while line = infile.gets&.strip
    if line.length == 0
      p pp
      valid_pps += 1 if is_valid(pp)
      pp = { 'byr': false, 'iyr': false, 'eyr': false, 'hgt': false, 'hcl': false, 'ecl': false, 'pid': false, 'cid': false}
    else
      line.split(' ').each do |field|
        f_name, f_val = field.split(':')
        pp[f_name] = f_val
        p f_name + ' = ' + pp[f_name]
      end
    end
  end
  valid_pps += 1 if is_valid(pp)
end

p "Found #{valid_pps} valid passports"
