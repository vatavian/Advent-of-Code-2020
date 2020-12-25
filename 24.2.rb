# Advent of Code 2020 Day 24 part 2 - Hexagonal cellular automata

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

  def all_neighbors
    @@neighbor_vector.values.map {|offset| self + offset}
  end
end

class Floor
  attr_accessor :black_tiles

  def initialize
    @min_x = 0
    @max_x = 0
    @min_y = 0
    @max_y = 0
    @black_tiles = Hash.new
  end

  def flip(tile)
    if black_tiles[tile]
      black_tiles.delete(tile)
    else
      black_tiles[tile] = true
      @min_x = tile[0] if tile[0] < @min_x
      @max_x = tile[0] if tile[0] > @max_x
      @min_y = tile[1] if tile[1] < @min_y
      @max_y = tile[1] if tile[1] > @max_y
    end
  end

  def step
    neighbors = Hash.new(0)
    next_state = Hash.new
    @black_tiles.each do |tile, value|
      tile.all_neighbors.each do |neighbor|
        neighbors[neighbor] += 1
      end
    end
    @black_tiles.each do |tile, value|
      next_state[tile] = true if neighbors[tile].between?(1, 2)
    end
    neighbors.each do |tile, num_neighbors|
      next_state[tile] = true if num_neighbors == 2 && !@black_tiles[tile]
    end
    @black_tiles = next_state
  end

  def print
    @black_tiles.each {|key, value| p key.to_s}
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

floor = Floor.new

input_number = 1
IO.readlines('24-input.txt', chomp: true).each do |line|
  directions = to_directions(line)
#p "Directions ##{input_number}: #{directions}"

  tile = HexTile[0,0]
  directions.each do |direction|
    tile = tile.neighbor_tile(direction)
  end

  floor.flip tile

#p "End at tile #{tile}"
  input_number += 1
end

p floor.black_tiles.length.to_s + ' tiles are black after initial flips'

(1..100).each {|day| puts "Day #{day} #{floor.step.length}"}