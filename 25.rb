# Advent of Code 2020 Day 25 part 1 - Combo Breaker

def transform(seed, num)
  seed *= num
  seed = seed.modulo(20201227)
end

pk1, pk2 = IO.readlines('25-input.txt', chomp: true)

pk1 = pk1.to_i
pk2 = pk2.to_i

p pk1, pk2

#pk1 = transform 1,7 [loopsize1] times

seed = 1
num = 7
loopsize1found = false
loopsize2found = false
loopsize1 = 0
loopsize2 = 0
until loopsize1found && loopsize2found
  seed *= num
  seed = seed.modulo(20201227)
  if !loopsize1found
    loopsize1 += 1
    if seed == pk1
      p "Loop size 1 = #{loopsize1}"
      loopsize1found = true
    end
  end
  if !loopsize2found
    loopsize2 += 1
    if seed == pk2
      p "Loop size 2 = #{loopsize2}"
      loopsize2found = true
    end
  end
#p "1: #{loopsize1}, 2: #{loopsize2}, seed: #{seed}"
end

seed = 1
loopsize2.times do
  seed *= pk1
  seed = seed.modulo(20201227)
end
p "2 produced key #{seed} from pk1"

seed = 1
loopsize1.times do
  seed *= pk2
  seed = seed.modulo(20201227)
end
p "1 produced key #{seed} from pk2"
