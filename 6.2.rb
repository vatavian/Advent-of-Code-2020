# Advent of Code 2020 Day 6 part 2

total_answers = 0
File.open('6-input.txt') do |infile|
  answers = nil
  while line = infile.gets&.strip
    #p line
    if line.length == 0
      if answers
        #p answers.count
        total_answers += answers.count
      end
      answers = nil
    elsif answers == nil
      answers = {}
      line.each_char {|c| answers[c] = true if c.between?('a', 'z') }
    else
      answers.each do |key, value|
        answers.delete(key) if !line.include?(key)
      end
    end
  end
  if answers
    #p answers.count
    total_answers += answers.count 
  end
end

p "Found #{total_answers} total answers"
