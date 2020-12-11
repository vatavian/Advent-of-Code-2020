# Advent of Code 2020 Day 11 part 2
# Now they care about the first seat they can see in each direction, not just adjacent seats

class Seats
  attr_accessor :all_seats

  def initialize(initial_occupancy)
    @all_seats = initial_occupancy
    @max_row = all_seats.length - 1
    @max_col = all_seats[0].length - 1
    @directions = []
    @directions.append [0, -1]  # left
    @directions.append [-1, -1] # up-left
    @directions.append [-1, 0]  # up
    @directions.append [-1, 1]  # up-right
    @directions.append [0, 1]   # right
    @directions.append [1, 1]   # down-right
    @directions.append [1, 0]   # down
    @directions.append [1, -1]  # down-left
  end

  def find_next_seat(row, col, row_dir, col_dir)
    check_row = row + row_dir
    check_col = col + col_dir
    while check_row >= 0 &&
          check_col >= 0 &&
          check_row <= @max_row &&
          check_col <= @max_col
      if @all_seats[check_row][check_col] == '.'
        check_row += row_dir
        check_col += col_dir
      else
#p "Seat seen #{row_dir}, #{col_dir} from  #{row}, #{col} = #{@all_seats[check_row][check_col]}"
        return @all_seats[check_row][check_col]
      end
    end
#p "Seat seen #{row_dir}, #{col_dir} from  #{row}, #{col} = . (none seen before edge)"
    return '.'
  end

  def none_seen(row, col)
    @directions.each do |direction|
      return false if self.find_next_seat(row, col, direction[0], direction[1]) == '#'
    end
  end

  def see_at_least(row, col, threshold)
    seen = 0
    return true if seen >= threshold # In case threshold is <= 0
    @directions.each do |direction|
      if self.find_next_seat(row, col, direction[0], direction[1]) == '#'
        seen += 1
        return true if seen >= threshold
      end
    end
    false
  end

  def step
    changed = false
    next_seats = []
    @all_seats.each_with_index do |old_row, row_index|
      next_seats << old_row.dup
      old_row.each_char.with_index do |old_seat, col_index|
        case old_seat
        when 'L'
          if none_seen( row_index, col_index)
            next_seats[row_index][col_index] = '#'
            changed = true
          end
        when '#'
          if see_at_least(row_index, col_index, 5)
            next_seats[row_index][col_index] = 'L'
            changed = true
          end
        end
      end
    end
    [next_seats, changed]
  end

  def count_occupied
    count = 0
    @all_seats.each {|row| count += row.count('#') }
    count
  end

  def print_seats
    @all_seats.each {|row| p row}
  end
end

seating = Seats.new(IO.readlines('11-input.txt', chomp: true))
seating.print_seats
step_num = 1
next_seats, changed = seating.step
while changed
  seating.all_seats = next_seats
p step_num
#seating.print_seats
  step_num += 1
  next_seats, changed = seating.step
end

p "No change detected after #{step_num} steps"
p seating.count_occupied.to_s + ' seats occupied'
