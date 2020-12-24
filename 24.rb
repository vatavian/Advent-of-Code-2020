# Advent of Code 2020 Day 24 part 1

require 'matrix'

class HexTile < Vector
  @@neighbor_vector = nil

  def neighbor_add(direction)
    if !@@neighbor_vector
      @@neighbor_vector = Hash.new
     # cube coordinates
     # @@neighbor_vector['e']  = [ 1, 0,-1]
     # @@neighbor_vector['se'] = [ 0, 1,-1]
     # @@neighbor_vector['sw'] = [-1, 1, 0]
     # @@neighbor_vector['w']  = [-1, 0, 1]
     # @@neighbor_vector['nw'] = [ 0,-1, 1]
     # @@neighbor_vector['ne'] = [ 1,-1, 0]
     # axial coordinates
      @@neighbor_vector['e']  = Vector[ 1, 0]
      @@neighbor_vector['se'] = Vector[ 0, 1]
      @@neighbor_vector['sw'] = Vector[-1, 1]
      @@neighbor_vector['w']  = Vector[-1, 0]
      @@neighbor_vector['nw'] = Vector[ 0,-1]
      @@neighbor_vector['ne'] = Vector[ 1,-1]
    end
    @@neighbor_vector[direction]
  end

  def neighbor_tile(direction)
#p "neighbor_tile #{direction} self = #{self} neighbor_add = #{neighbor_add(direction)}"
    self + neighbor_add(direction)
  end
end

def to_directions(line_of_directions)
  directions = []
  last_char = ''

  line_of_directions.each_char do |ch| 
    case ch
    when 'e', 'w'
      directions.append last_char + ch
      last_char = ''
    when 's', 'n'
      last_char = ch
    end
  end

  directions
end

black_tiles = Hash.new

input_number = 1
IO.readlines('24-input.txt', chomp: true).each do |line|
  directions = to_directions(line)
p "Directions ##{input_number}: #{directions}"

  tile = HexTile[0,0]
  directions.each do |direction|
    tile = tile.neighbor_tile(direction)
  end
  if black_tiles[tile]
    black_tiles.delete(tile)
  else
    black_tiles[tile] = true
  end
  
p "End at tile #{tile}"
  input_number += 1
end

p black_tiles.length.to_s + ' tiles are black.'