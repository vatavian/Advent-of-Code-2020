# Advent of Code 2020 Day 14 part 2, memory address decoder
require 'csv'

def all_floats(n, float_bits, bit_index)
  if bit_index >= float_bits.length
    [n]
  else
    bit = float_bits[bit_index]
    all_floats(n & ~bit, float_bits, bit_index + 1) +
      all_floats(n | bit, float_bits, bit_index + 1)
  end
end

#Dir.glob("14-sample*") do |filename|
['14-input.txt'].each do |filename|
  p filename
  mask_set = 0
  mask_float = 0
  float_bits = []
  mem = Hash.new(default:0)
  IO.readlines(filename, chomp: true).each do |instruction|
    op, value = instruction.split(' = ')
    if op == 'mask'
      mask_set = 0
      mask_float = 0
      float_bits = []
      bit_value = 1 << 35
      value.each_char do |ch|
        mask_set = mask_set << 1
        mask_float = mask_float << 1
        if ch == '1'
          mask_set += 1
        elsif ch == 'X'
          mask_float += 1
          float_bits.append bit_value
        end
        bit_value = bit_value >> 1
      end
      
#p "mask set = #{mask_set.to_s(2)}"
#p "mask float = #{mask_float.to_s(2)}"
#p "float bits = #{float_bits.to_s}"
    else
      val_written = value.to_i
      address = op[4,99].to_i
      addr_set = address | mask_set
      all_floats(addr_set, float_bits, 0).sort.each do |addr_float|
#p "mem[#{addr_float}] = #{val_written}"
        mem[addr_float] = val_written
      end
    end
  end
  p mem.values.sum
end
#1205897099811: That's not the right answer; your answer is too low.