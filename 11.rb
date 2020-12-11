# Advent of Code 2020 Day 11

def none_adjacent(all_seats, row, col, max_row, max_col)
    (col == 0       || all_seats[row][col-1] != '#') &&
    (col == max_col || all_seats[row][col+1] != '#') &&
    (row == 0 || (col == 0 || all_seats[row-1][col-1] != '#') &&
                 (all_seats[row-1][col] != '#') &&
                 (col == max_col || all_seats[row-1][col+1] != '#')) &&
    (row == max_row || (col == 0 || all_seats[row+1][col-1] != '#') &&
                       (all_seats[row+1][col] != '#') &&
                       (col == max_col || all_seats[row+1][col+1] != '#'))
end

def at_least_adjacent(all_seats, row, col, max_row, max_col, threshold)
  count_adjacent = 0
  return true if count_adjacent >= threshold # In case threshold is <= 0

  start_row = [row - 1, 0].max
  end_row = [row + 1, max_row].min
  start_col = [col - 1, 0].max
  end_col = [col + 1, max_col].min

  (start_row..end_row).each do |check_row|
    (start_col..end_col).each do |check_col|
      if (check_row != row || check_col != col) && all_seats[check_row][check_col] == '#'
        count_adjacent += 1
        return true if count_adjacent >= threshold
      end
    end
  end
  false
end

def step(all_seats, max_row, max_col)
  changed = false
  next_seats = []
  all_seats.each_with_index do |old_row, row_index|
    next_seats << old_row.dup
    old_row.each_char.with_index do |old_seat, col_index|
      case old_seat
      when 'L'
        if none_adjacent(all_seats, row_index, col_index, max_row, max_col)
          next_seats[row_index][col_index] = '#'
          changed = true
        end
      when '#'
        if at_least_adjacent(all_seats, row_index, col_index, max_row, max_col, 4)
          next_seats[row_index][col_index] = 'L'
          changed = true
        end
      end
    end
  end
  [next_seats, changed]
end

def count_occupied(all_seats)
  count = 0
  all_seats.each {|row| count += row.count('#') }
  count
end

def print_seats(all_seats)
  all_seats.each {|row| p row}
end

all_seats = IO.readlines('11-input.txt', chomp: true)
print_seats(all_seats)
max_row = all_seats.length - 1
max_col = all_seats[0].length - 1
step_num = 1
next_seats, changed = step(all_seats, max_row, max_col)
while changed
  all_seats = next_seats
p step_num
print_seats(all_seats)
  step_num += 1
  next_seats, changed = step(all_seats, max_row, max_col)
end

p "No change detected after #{step_num} steps"
p count_occupied(all_seats).to_s + ' seats occupied'
