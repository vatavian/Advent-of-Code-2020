# Advent of Code 2020 Day 22 part 1

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

  def score(deck_num)
    index_subtract = @deck[deck_num].length
    sum = 0
    @deck[deck_num].each_with_index do |card, index|
      sum += card * (index_subtract - index)
    end
    sum
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
card_game.play
p "Player 1 score = #{card_game.score(0)}"
p "Player 2 score = #{card_game.score(1)}"