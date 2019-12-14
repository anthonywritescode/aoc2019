if ARGV.empty?
  puts "usage: ruby #{__FILE__} FILENAME"
  exit 1
end

prog_l = File.read(ARGV[0]).strip.split(',').map(&:to_i)
prog = Hash.new { |h, k| h[k] = 0 }
prog_l.each_with_index do |v, i|
  prog[i] = v
end
rb = pc = 0

def param(prog, pc, rb, instr, n)
  mode = instr / (10**(n + 1)) % 10
  case mode
  when 0
    prog[prog[pc + n]]
  when 1
    prog[pc + n]
  when 2
    prog[rb + prog[pc + n]]
  else
    raise StandardError, 'unreachable!'
  end
end

def store(prog, pc, rb, instr, n)
  mode = instr / (10**(n + 1)) % 10
  case mode
  when 0
    prog[pc + n]
  when 2
    rb + prog[pc + n]
  else
    raise StandardError, 'unreachable!'
  end
end

board = Hash.new { |h, k| h[k] = 0 }
read_queue = []

loop do
  instr = prog[pc]
  opc = instr % 100
  case opc
  when 99
    total = 0
    board.each_value do |v|
      total += 1 if v == 2
    end
    puts total
    exit 0
  when 1
    prog[store(prog, pc, rb, instr, 3)] = (
        param(prog, pc, rb, instr, 1) + param(prog, pc, rb, instr, 2)
    )
    pc += 4
  when 2
    prog[store(prog, pc, rb, instr, 3)] = (
        param(prog, pc, rb, instr, 1) * param(prog, pc, rb, instr, 2)
    )
    pc += 4
  when 3
    # TODO: input function
    prog[store(prog, pc, rb, instr, 1)] = 1
    pc += 2
  when 4
    read_queue.push(param(prog, pc, rb, instr, 1))
    if read_queue.length == 3
      x, y, tile = read_queue
      board[[x, y]] = tile
      read_queue.clear
    end
    pc += 2
  when 5
    if param(prog, pc, rb, instr, 1) != 0
      pc = param(prog, pc, rb, instr, 2)
    else
      pc += 3
    end
  when 6
    if param(prog, pc, rb, instr, 1).zero?
      pc = param(prog, pc, rb, instr, 2)
    else
      pc += 3
    end
  when 7
    if param(prog, pc, rb, instr, 1) < param(prog, pc, rb, instr, 2)
      prog[store(prog, pc, rb, instr, 3)] = 1
    else
      prog[store(prog, pc, rb, instr, 3)] = 0
    end
    pc += 4
  when 8
    if param(prog, pc, rb, instr, 1) == param(prog, pc, rb, instr, 2)
      prog[store(prog, pc, rb, instr, 3)] = 1
    else
      prog[store(prog, pc, rb, instr, 3)] = 0
    end
    pc += 4
  when 9
    rb += param(prog, pc, rb, instr, 1)
    pc += 2
  else
    raise StandardError, 'unreachable!'
  end
end
