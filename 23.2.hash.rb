# Advent of Code 2020 Day 23 part 2 - Crab Cups ten million times

#class CircularList from https://gist.github.com/amiralles/dcf84f1061c7df2961853906ab427542
class CircularList
	class Node
		attr_accessor :next, :data
		def initialize data
			self.data = data
			self.next = nil
		end
	end

	attr_accessor :head, :current, :length, :hash

	# Initialize an empty lits.
	# Complexity: O(1).
	def initialize
		self.head   = nil
		self.length = 0
    self.hash = Hash.new
	end


	# Inserts a new node next to the specified node.
	# Complexity: O(1).
	def insert_next prev_node, data
		new_node = Node.new data
		if self.length == 0
			self.head = new_node.next = new_node
		else
			new_node.next = prev_node.next
			prev_node.next = new_node
		end
		self.length += 1
    self.hash[data] = new_node
    new_node
	end

	# Removes the node that is next to the specified node.
	# Complexity: O(1).
	def remove_next prev_node
		return nil unless self.length > 0

        unless prev_node
            # remove head.
            self.head = self.head.next
        else
            self.hash.delete(prev_node.next.data)
            if prev_node.next == prev_node
                self.head = nil
            else
                old = prev_node.next
                prev_node.next = prev_node.next&.next
                if (old == self.head)
                    self.head = old.next
                end
            end
        end

    	self.length -= 1
	end


	# Removes all items form the list.
	# Complexity: O(n).
	def clear
		while self.length > 0
			remove self.head
		end
	end

	# Moves to the next node.
	def move_next
		self.current = self.current&.next
	end

	# Conviniece methods

	# Traverse all of the elements from the list
	# without wrapping around. 
	# (Starts from the head node and halts when 
	# gets back to it.) 
	def full_scan
		return nil unless block_given?

		self.current = self.head
		# If you are not familiar with ruby this
		# is the recommended way to write: do { p } while (q);
		loop do
			yield self.current
			break if (move_next == self.head)
		end
	end

	# Finds the first occurence that matched
	# the given predicate.
	# Complexity: O(n).
	def find_first &predicate
		return nil unless block_given?

		self.current = self.head
		loop do
			return self.current if predicate.call(self.current)
			break if (move_next == self.head)
		end
	end

	# Finds the first occurence that matched
	# the given predicate.
	# Complexity: O(n).
	def find_data data
    found = self.hash[data]
    if found
      self.current = found
      return found
    end
p "find_data not found in hash: #{data}"
		self.current = self.head
		loop do
			return self.current if self.current.data == data
			break if (move_next == self.head)
		end
	end

	# Prints the contents of the list.
	# Complexity: O(n).
	def print
		if self.length == 0
			puts "empty"
		else
			self.full_scan { |item| puts item.data }
		end
	end

end

cups = CircularList.new

# start_array = [3,8,9,1,2,5,4,6,7] # sample
start_array = [4,7,6,1,3,8,2,5,9] # input

last = nil

start_array.each {|new_number| last = cups.insert_next(last, new_number)} 
@max_cup = start_array.max
@min_cup = start_array.min

new_max = 1000000
(@max_cup+1..new_max).each {|new_number| last = cups.insert_next(last, new_number)}
@max_cup = new_max

p "Max cup inserted: #{@max_cup}"

def move(cups)
  current_cup = cups.current

#msg = "cups: "
#scanner = current_cup
#(1..9).each {|cup| msg += scanner.data.to_s + ', '; scanner = scanner.next}
#puts msg

  move_cups = [current_cup.next.data, current_cup.next.next.data, current_cup.next.next.next.data]
  cups.remove_next current_cup
  cups.remove_next current_cup
  cups.remove_next current_cup

#puts "pick up: #{move_cups}"
  
  destination_val = current_cup.data - 1
  destination_val = @max_cup if destination_val < @min_cup

  while move_cups.include?(destination_val)
    destination_val -= 1
    destination_val = @max_cup if destination_val < @min_cup
  end
#puts "destination: #{destination_val}"

  destination_node = cups.find_data(destination_val)
#puts "found: #{cups.current.data}"
  cups.insert_next(destination_node, move_cups[2])
  cups.insert_next(destination_node, move_cups[1])
  cups.insert_next(destination_node, move_cups[0])
  cups.current = current_cup.next
end

cups.current = cups.head
(1..10000000).each { |move| p "-- move #{move}"; move cups}

msg = "cups: "
scanner = cups.current
(1..9).each {|cup| msg += scanner.data.to_s + ', '; scanner = scanner.next}
puts msg

cup_1 = cups.find_data(1)
cup_2 = cup_1.next
cup_3 = cup_2.next
puts "cups: #{cup_1.data}, #{cup_2.data}, #{cup_3.data}"
puts "multiply two cups after cup 1 = #{cup_2.data * cup_3.data}"