# Advent of Code 2020 Day 20 part 1

class Tile

  attr_accessor :id
  attr_accessor :edges
  attr_accessor :num_matches

  def initialize(lines_read)
    @id = lines_read[0].split(' ')[1].sub(':', '')
    # p "Initialize tile " + @id
    left_edge = ''
    right_edge = ''
    lines_read[1..-1].each do |line|
      left_edge += line[0]
      right_edge += line[-1]
    end
    @edges = [lines_read[1], right_edge, lines_read[-1], left_edge]
    @num_matches = 0
  end

  def matches?(other_tile)
    @edges.each do |my_edge|
      other_tile.edges.each do |other_edge|
        return true if my_edge == other_edge || my_edge.reverse == other_edge
      end
    end
    false
  end

end

tiles = []
lines_read = []
IO.readlines('20-input.txt', chomp: true).each do |line|
  if line.length == 0
    if lines_read.length > 0
      tile = Tile.new(lines_read)
      tiles.append tile
      lines_read = []
    end
  else
    lines_read.append line
  end
end

if lines_read.length > 0
  tile = Tile.new(lines_read)
  tiles.append tile
end

p "Found #{tiles.length} tiles."

tiles.each_with_index do |tile1, index|
  # p "Checking for matches with #{tile1.id}"
  tiles[(index + 1)..-1].each do |tile2|
    if tile1.matches?(tile2)
      tile1.num_matches += 1
      tile2.num_matches += 1
    end
  end
end

mult_corner_ids = 1
tiles.each do |tile|
  p tile.id + ' matches ' + tile.num_matches.to_s
  if tile.num_matches == 2
    p tile.id + ' matches two others so it must be a corner.'
    mult_corner_ids *= tile.id.to_i
  end
end

p mult_corner_ids