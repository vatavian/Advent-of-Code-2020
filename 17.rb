# Advent of Code 2020 Day 17 part 1, Conway Cubes in a pocket universe

class Universe
  attr_accessor :all_cubes

  def initialize(initial_state)
    @min_x = 0
    @max_x = initial_state[0].length - 1
    @min_y = 0
    @max_y = initial_state.length - 1
    @all_cubes = Hash.new
    z = 0
    initial_state.each_with_index do |row, y|
      row.each_char.with_index {|char, x| @all_cubes[[x,y,z]] = true if char == '#'}
    end
    @neighbor_directions = [-1, 0, 1].repeated_permutation(3).to_a
    @neighbor_directions.delete([0,0,0])
    p "Neighbor directions [#{@neighbor_directions.length}]: \n#{@neighbor_directions}"
  end

  def find_next_seat(row, col, row_dir, col_dir)
  end

  def step
    changed = false
    neighbors = Hash.new(0)
    next_cubes = Hash.new
    @all_cubes.each do |key, value|
      x,y,z = key
      @neighbor_directions.each do |dir|
        neighbor_key = [x+dir[0],y+dir[1],z+dir[2]]
        neighbors[neighbor_key] += 1
      end
    end
    @all_cubes.each do |key, value|
      next_cubes[key] = true if neighbors[key].between?(2, 3)
    end
    neighbors.each do |key, num_neighbors|
      next_cubes[key] = true if num_neighbors == 3 && !@all_cubes[key]
    end
    next_cubes
  end

  def print_seats
    @all_cubes.each {|key, value| p key[0].to_s + ', ' + key[1].to_s + ', ' + key[2].to_s + ' = ' + value.to_s}
  end
end

u = Universe.new(IO.readlines('17-input.txt', chomp: true))
u.print_seats
(1..6).each do |step_num|
  next_cubes = u.step
  u.all_cubes = next_cubes
p step_num
p u.print_seats
end

p u.all_cubes.length.to_s + ' cubes active'
