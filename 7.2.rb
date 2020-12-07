# Advent of Code 2020 Day 7 part 2

class Rule
  attr_accessor :container
  attr_accessor :contains
  def initialize(rule_text)
    @contains = Hash.new
    @container, contents_text = rule_text.split(' bags contain ')
    contents_text.split(',').each do |raw_content|
      num, adjective, color, bag = raw_content.split(' ')
      @contains[adjective + ' ' + color] = num.to_i if num != 'no'
    end
  end

  def to_s
    @container + ' bags contain ' + contains.to_s
  end

  def can_contain(bag, rules)
    if contains.has_key?(bag)
      # p @container + ' contains ' + bag + ' directly.'
      return true
    else
      contains.each_key do |key|
        if rules[key]&.can_contain(bag, rules)
          #p @container + ' contains ' + rules[key].container + ' which can contain ' + bag
          return true 
        else
          #p rules[key].container + ' cannot contain ' + bag
        end
      end
    end
    false
  end

  def total_contents(rules)
    total = 0
    contains.each do |key, num_bags|
      total += num_bags # self contains this many of this kind of bag directly
      if key_rule = rules[key]
        total += num_bags * key_rule.total_contents(rules)
      end
    end
    total
  end
end

rules = Hash.new
File.open('7-input.txt') do |infile|
  while line = infile.gets&.chomp
    rule = Rule.new(line)
    # p rule.to_s
    if rules[rule.container]
      p "Additional rule found: " + rule.to_s
      p "Previously found rule: " + rules[rule.container].to_s
    end
    rules[rule.container] = rule
  end
end
bag = 'shiny gold'

p bag + ' must contain this many other bags: ' + rules[bag].total_contents(rules).to_s