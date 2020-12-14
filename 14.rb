# Advent of Code 2020 Day 14
require 'csv'

#Dir.glob("14-sample*") do |filename|
['14-input.txt'].each do |filename|
  p filename
  mask_set = 0
  mask_clear = 0
  mem = Hash.new(default:0)
  IO.readlines(filename, chomp: true).each do |instruction|
    op, value = instruction.split(' = ')
    if op == 'mask'
      mask_set = 0
      mask_clear = 0
      value.each_char do |ch|
        mask_set = mask_set << 1
        mask_clear = mask_clear << 1
        if ch == '1'
          mask_set += 1
        elsif ch == '0'
          mask_clear += 1
        end
      end
p "mask set = #{mask_set.to_s(2)}"
p "mask clr = #{mask_clear.to_s(2)}"
    else
      address = op[4,99].to_i
      val_written = (value.to_i | mask_set) & ~mask_clear
p "mem[#{address}] = #{value} but mask makes value = #{val_written}"
      mem[address] = val_written
    end
  end
  p mem.values.sum
end
