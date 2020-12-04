# Advent of Code 2020 Day 4

EYE_COLORS = ['amb', 'blu', 'brn', 'gry', 'grn', 'hzl', 'oth']

def is_valid(pp)
 if pp['byr'] && pp['iyr'] && pp['eyr'] && pp['hgt'] && pp['hcl'] && pp['ecl'] && pp['pid']
  if /\A[0-9]{4}\Z/ =~ pp['byr']
    byr = pp['byr'].to_i
    if byr && byr >= 1920 && byr <= 2002
      if /\A[0-9]{4}\Z/ =~ pp['iyr']
        iyr = pp['iyr'].to_i
        if iyr && iyr >= 2010 && iyr <= 2020 
          if /\A[0-9]{4}\Z/ =~ pp['eyr']
            eyr = pp['eyr'].to_i
            if eyr >= 2020 && eyr <= 2030
              hgt = pp['hgt'][0..-3].to_i
              if hgt 
                #p 'hgt == ' + hgt.to_s
                if ((/[0-9]+cm\Z/ =~ pp['hgt'] && hgt >= 150 && hgt <= 193) \
                 || (/[0-9]+in\Z/ =~ pp['hgt'] && hgt >= 59 && hgt <= 76)) 
                  if /\A#[0-9a-f]{6}\Z/ =~ pp['hcl'] 
                    if EYE_COLORS.include?(pp['ecl'])
                      if /\A[0-9]{9}\Z/ =~ pp['pid']
                        p 'valid: ' + pp.sort.to_s
                        return true
                      else
                        p "bad pid #{pp['pid']}"
                      end
                    else
                      p "bad eye color #{pp['ecl']}"
                    end
                  else
                    p "bad hcl #{pp['hcl']}"
                  end
                else
                 p 'bad hgt: ' + pp['hgt']
                end
              else
                #p ' hgt numeric not set: ' + pp['hgt']
              end
            else
              #p ' eyr not between 2020 .. 2030: ' + pp['eyr']
            end
          else
            #p ' eyr not 4-digit year: ' + pp['eyr']
          end
        end
      end
    end
  end
 end
 return false
end

valid_pps = 0
num_pps = 0
pp = Hash.new(false)
File.open('4-input.txt') do |infile|
  while line = infile.gets&.strip
    if line.length == 0
      #p pp
      valid_pps += 1 if is_valid(pp)
      num_pps += 1
      pp = Hash.new(false)
    else
      line.split(' ').each do |field|
        f_name, f_val = field.split(':')
        pp[f_name] = f_val
        # p f_name + ' = ' + pp[f_name]
      end
    end
  end
  valid_pps += 1 if is_valid(pp)
  num_pps += 1
end

p "Found #{valid_pps} valid passports out of #{num_pps}"
