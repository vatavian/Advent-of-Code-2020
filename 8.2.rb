# Advent of Code 2020 Day 8

class Machine
  attr_accessor :program
  attr_accessor :pc
  attr_accessor :accumulator
  attr_accessor :halted

  def initialize(program_lines)
    @program = []
    program_lines.each do |line|
      instruction, arg = line.split(' ')
      arg = arg.to_i
      @program.append([instruction, arg, false])
    end
    @program = program
    @pc = 0
    @accumulator = 0
    @halted = false
  end

  def reset
    @pc = 0
    @accumulator = 0
    @halted = false
    @program.each_with_index do |line, index|
      @program[index][2] = false
    end
  end

  def run(inputs, pause_on_output)
    if @halted
      p 'Tried to run after halting'
      return nil 
    end
    input_index = 0
    output = nil
    loop do
      return accumulator if @pc >= @program.length
      instruction, arg, ran_already = @program[@pc]

      if ran_already
        p "Started to re-run instruction #{@pc}: #{@program[@pc].to_s}"
        return nil # accumulator
      else
        @program[@pc][2] = true # set flag that this instruction ran already
      end
      p 'run #' + @pc.to_s + ': ' + @program[@pc].to_s
      case instruction
      when 'nop'
        @pc += 1
      when 'acc'
        @accumulator += arg
        @pc += 1
      when 'jmp'
        @pc += arg
      else
        p 'Error: found unknown instruction ' + @program[@pc].to_s + ' at ' + @pc.to_s
        return nil
      end
    end
  end
end

machine = Machine.new(IO.readlines('8-input.txt', chomp: true))
machine.program.each_with_index do |line, index| 
  machine.reset
  if line[0] == 'nop'
    machine.program[index][0] = 'jmp'
    p 'Line ' + index.to_s + ' found nop, changed to ' + machine.program[index].to_s
    acc = machine.run(nil, false)
    if acc
      p 'Line ' + index.to_s + ' changed to jmp, Successful return: ' + acc.to_s
      break
    end
    machine.program[index][0] = 'nop'
  elsif line[0] == 'jmp'
    machine.program[index][0] = 'nop'
    p 'Line ' + index.to_s + ' found jmp, changed to ' + machine.program[index].to_s
    acc = machine.run(nil, false)
    if acc
      p 'Line ' + index.to_s + ' changed to nop, Successful return: ' + acc.to_s
      break
    end
    machine.program[index][0] = 'jmp'
  end
end
