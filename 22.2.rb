# Advent of Code 2020 Day 22 part 2 - Recursive Combat

class SpaceCards
  attr_accessor :deck

  def initialize(deck)
    @deck = deck
p "Init with #{@deck[0].length} cards for player 1 and #{@deck[1].length} cards for player 2."
  end

  def play
    num_rounds = 0
    while @deck[0].length > 0 && @deck[1].length > 0
      c0 = @deck[0].shift
      c1 = @deck[1].shift
      if c0 > c1
        @deck[0].append(c0).append(c1)
      else
        @deck[1].append(c1).append(c0)
      end
      num_rounds += 1
    end
    p "Play lasted #{num_rounds} rounds."
  end

  def play_recursive
    @num_recursive_rounds = 0
    @previous_states = []
    winner = recursive_combat
    @previous_states = []
    p "Recursive game lasted #{@num_recursive_rounds} rounds."
    winner
  end

  def score(deck_num)
    index_subtract = @deck[deck_num].length
    sum = 0
    @deck[deck_num].each_with_index do |card, index|
      sum += card * (index_subtract - index)
    end
    sum
  end

  private

  def recursive_combat  
    while @deck[0].length > 0 && @deck[1].length > 0
#p @deck
      return 0 if @previous_states.include?(@deck)
      @previous_states.append([@deck[0].dup, @deck[1].dup])

      c0 = @deck[0].shift
      c1 = @deck[1].shift
#p "Player 1 plays: #{c0}"
#p "Player 2 plays: #{c1}"
      if c0 <= @deck[0].length && c1 <= @deck[1].length
#p "Playing a sub-game to determine the winner..."
        next_game = SpaceCards.new([@deck[0][0..c0-1], @deck[1][0..c1-1]])
        winner = next_game.play_recursive
      else
        winner = c0 > c1 ? 0 : 1
      end

      if winner == 0
        @deck[0].append(c0).append(c1)
      else
        @deck[1].append(c1).append(c0)
      end
      @num_recursive_rounds += 1
    end
    @deck[0].length > 0 ? 0 : 1
  end

end

rules = nil
deck = []
deck[0] = []
deck[1] = []
deck_num = 0
IO.readlines('22-input.txt', chomp: true).each do |line|
  if line.length > 0
    card = line.to_i
    if card > 0
      deck[deck_num].append card
    elsif line.start_with?('Player 2')
      deck_num = 1
    end
  end
end

card_game = SpaceCards.new(deck)
p "Recursive winner: #{card_game.play_recursive + 1}"
p "Player 1 score = #{card_game.score(0)}"
p "Player 2 score = #{card_game.score(1)}"