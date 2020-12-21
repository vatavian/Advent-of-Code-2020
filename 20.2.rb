# Advent of Code 2020 Day 20 part 2 - find sea monsters

class Tile

  attr_accessor :id
  attr_accessor :edges # [top, right, bottom, left]
  attr_accessor :pixels
  attr_accessor :matches

  def initialize(lines_read)
    @id = lines_read[0].split(' ')[1].sub(':', '')
    # p "Initialize tile " + @id
    left_edge = ''
    right_edge = ''
    pixels = []
    lines_read[1..-1].each do |line|
      left_edge += line[0]
      pixels.append(line[1..-2])
      right_edge += line[-1]
    end
    @edges = [lines_read[1], right_edge, lines_read[-1], left_edge]
    @matches = []
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

class TiledImage
  def initialize(tiles)
    set_all_tile_edge_matches!(tiles)
    corners = find_corners(tiles)
  end

  def set_all_tile_edge_matches!(tiles)
    tiles.each {|tile| tile.matches = []}
    tiles.each_with_index do |tile1, index|
      tiles[(index + 1)..-1].each do |tile2|
        if tile1.matches?(tile2)
          tile1.matches.append(tile2)
          tile2.matches.append(tile1)
        end
      end
    end
  end

  def find_corners(tiles)
    corners = []
    tiles.each do |tile|
      num_matches = tile.matches.length
      #p tile.id + ' matches ' + num_matches.to_s
      if num_matches == 2
        p tile.id + ' matches two others so it must be a corner.'
        corners.append(tile)
      end
    end
    corners
  end

  def count_non_monsters(seek, monster_pattern)
    
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

whole_image = TiledImage.new(tiles)

p whole_image.count_non_monsters('#', "                  # \n#    ##    ##    ###\n #  #  #  #  #  #\n")