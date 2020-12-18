# Advent of Code 2020 Day 18 part 1, evaluate addition and multiplication with parentheses and equal precedence

require 'dentaku'

def eval(equation)
  #next_token, rest = equation.split(' ', 2)
  calculator = Dentaku::Calculator.new
  calculator.evaluate(equation)
end

sum = 0
IO.readlines('18-input.txt', chomp: true).each {|equation| sum += eval(equation) }

p sum
