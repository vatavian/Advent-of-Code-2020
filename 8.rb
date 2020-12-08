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

  def run(inputs, pause_on_output)
    if @halted
      p 'Tried to run after halting'
      return nil 
    end
    input_index = 0
    output = nil
    loop do
      instruction, arg, ran_already = @program[@pc]

      if ran_already
        p "Started to re-run instruction #{@pc}: #{@program[@pc].to_s}"
        return accumulator
      else
        @program[@pc][2] = true # set flag that this instruction ran already
      end

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
p machine.run(nil, false)
