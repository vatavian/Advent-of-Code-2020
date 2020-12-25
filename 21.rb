# Advent of Code 2020 Day 21 part 1 and 2 - Allergen Assessment

require 'set'

class Food

  attr_accessor :ingredients
  attr_accessor :allergens

  def initialize(line)
    ingredients_str, allergens_str = line.split(' (contains ')
    @ingredients = ingredients_str.split(' ')
    @allergens = allergens_str[0..-2].split(', ')
  end

  def to_s
    'ingredients: ' + @ingredients.to_s + ' allergens: ' + @allergens.to_s
  end
end

all_allergens = Hash.new
ingredient_known_allergen = Hash.new
all_ingredients = Hash.new(0)

IO.readlines('21-input.txt', chomp: true).each do |line|
  food = Food.new(line)
#p food.to_s
  food.ingredients.each {|ingredient| all_ingredients[ingredient] += 1}
  food.allergens.each do |allergen|
    possible_ingredients = all_allergens[allergen]
    if possible_ingredients
#p "Allergen #{allergen} already had possible ingredients it was found in: #{possible_ingredients}"
      all_allergens[allergen] = possible_ingredients.intersection(food.ingredients)
    else
      all_allergens[allergen] = Set.new(food.ingredients)
    end
#p "Allergen #{allergen} now has possible ingredients: #{all_allergens[allergen]}"
  end
end

done = false

while !done
  done = true
  all_allergens.each do |allergen, ingredients|
    if ingredients.length == 1 
      ingredients.each do |ingredient|
        if !ingredient_known_allergen.key?(ingredient)
          ingredient_known_allergen[ingredient] = allergen
          all_allergens.each do |other_allergen, other_ingredients|
            other_ingredients.delete ingredient if other_allergen != allergen
          end
          done = false
          break      
        end
      end
    end
  end
end

#p "Allergens: #{all_allergens}"

#p "All Ingredients: #{all_ingredients}"

p "All Ingredients we know which allergen is contained: #{ingredient_known_allergen}"

p "All allergens that we are not sure which ingredient contains them:"
all_allergens.each do |allergen, ingredients|
   p allergen + " may be in any of: " + ingredients.to_s if ingredients.length != 1
end

total_non_allergen_ingredient_appearances = 0
p "All ingredients that we do not believe contain an allergen:"
all_ingredients.each do |ingredient, num_foods|
  allergen_found = false
  all_allergens.each do |allergen, ingredients|
    if ingredients.include?(ingredient)
      allergen_found = true
      break
    end
  end
  if !allergen_found
    #p "#{ingredient} appears #{num_foods} times."
    total_non_allergen_ingredient_appearances += num_foods
  end
end

p total_non_allergen_ingredient_appearances.to_s + ' total non-allergen ingredient appearances.'