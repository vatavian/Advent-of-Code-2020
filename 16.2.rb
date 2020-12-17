# Advent of Code 2020 Day 16, part 2

invalid_total = 0
ranges = Hash.new
could_be = Hash.new
section = :head
IO.readlines('16-input.txt', chomp: true).each do |line|
  if line.length > 0
    if section == :head
      label, values = line.split(':')
      case label
      when 'your ticket'
        section = :your_ticket
p "Switch to section :your_ticket"
      when 'nearby tickets'
        section = :nearby_tickets
p "Switch to section :your_ticket"
      else
        range1, range2 = values.split(' or ')
        range1start, range1end = range1.split('-')
        range2start, range2end = range2.split('-')
        ranges[label] = [(range1start.to_i..range1end.to_i), (range2start.to_i..range2end.to_i)]
      end
    elsif section == :your_ticket
      your_nums = line.split(',').map{|field| field.to_i}
      all_range_keys = ranges.keys
      your_nums.each_with_index do |num, index|
        could_be[index] = all_range_keys.dup
        ranges.each do |key, value|
          if !value[0].cover?(num) && !value[1].cover?(num)
p 'Your ticket field ' + index.to_s + ' = ' + num.to_s + ' is not a ' + key
            could_be[index].delete(key)
          end
        end
      end
      section = :nearby_tickets
    elsif section == :nearby_tickets
      if line.include?(',')
        nums = line.split(',').map{|field| field.to_i}
        valid = false
        nums.each do |num|
          valid = false
          ranges.each_value do |range12|
            if range12[0].cover?(num) || range12[1].cover?(num)
               valid = true 
               break
            end
          end
          if !valid
            break
          end
        end
        if valid
          nums.each_with_index do |num, index|
            ranges.each do |key, value|
              if !value[0].cover?(num) && !value[1].cover?(num)
#p 'Your ticket field ' + index.to_s + ' = ' + num.to_s + ' is not a ' + key
                could_be[index].delete(key)
              end
            end
          end
        end
      end
    end
  end
end

p could_be