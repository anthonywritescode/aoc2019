import Foundation

if (CommandLine.arguments.count != 2) {
    print("usage \(CommandLine.arguments[0]) FILENAME")
    exit(1)
}

let contents: String
do {
    let path = URL(fileURLWithPath: CommandLine.arguments[1])
    contents = try String(contentsOf: path, encoding: .utf8)
}
catch {
    print("error opening file \(CommandLine.arguments[1])")
    exit(1)
}

let trimmed = contents.trimmingCharacters(in: .whitespacesAndNewlines)
let parts = trimmed.components(separatedBy: ",").map { Int($0)! }
var prog = Dictionary(uniqueKeysWithValues: zip(parts.indices, parts))

func param(
        prog: Dictionary<Int, Int>,
        pc: Int, rb: Int, instr: Int, n: Int
) -> Int {
    let mode = instr / Int(pow(Double(10), Double(n + 1))) % 10
    switch mode {
        case 0:
            return prog[prog[pc + n, default: 0], default: 0]
        case 1:
            return prog[pc + n, default: 0]
        case 2:
            return prog[rb + prog[pc + n, default: 0], default: 0]
        default:
            assert(false, "unreachable")
    }
}

func store(
        prog: Dictionary<Int, Int>,
        pc: Int, rb: Int, instr: Int, n: Int
) -> Int {
    let mode = instr / Int(pow(Double(10), Double(n + 1))) % 10
    switch mode {
        case 0:
            return prog[pc + n, default: 0]
        case 2:
            return rb + prog[pc + n, default: 0]
        default:
            assert(false, "unreachable")
    }
}

struct Coord: Hashable {
    var x: Int = 0
    var y: Int = 0
}

enum Dir {
    case up
    case down
    case left
    case right
}
let RIGHT = [Dir.up, Dir.right, Dir.down, Dir.left]
let LEFT = [Dir.left, Dir.down, Dir.right, Dir.up]

var painted = Dictionary<Coord, Int>()
var direction = Dir.up
var x = 0
var y = 0
var colorMode = true

var rb = 0
var pc = 0

while (true) {
    let instr = prog[pc, default: 0]
    let opc = instr % 100

    switch (opc) {
        case 99:
            print(painted.count)
            exit(0)
        case 1:
            prog[store(prog: prog, pc: pc, rb: rb, instr: instr, n: 3)] =
                param(prog: prog, pc: pc, rb: rb, instr: instr, n: 1) +
                param(prog: prog, pc: pc, rb: rb, instr: instr, n: 2)
            pc += 4
        case 2:
            prog[store(prog: prog, pc: pc, rb: rb, instr: instr, n: 3)] =
                param(prog: prog, pc: pc, rb: rb, instr: instr, n: 1) *
                param(prog: prog, pc: pc, rb: rb, instr: instr, n: 2)
            pc += 4
        case 3:
            let idx = store(prog: prog, pc: pc, rb: rb, instr: instr, n: 1)
            prog[idx] = painted[Coord(x: x, y: y), default: 0]
            pc += 2
        case 4:
            let n = param(prog: prog, pc: pc, rb: rb, instr: instr, n: 1)
            if colorMode {
                painted[Coord(x: x, y: y)] = n
            } else {
                if n == 0 {
                    direction = LEFT[(LEFT.firstIndex(of: direction)! + 1) % 4]
                } else {
                    direction = RIGHT[(RIGHT.firstIndex(of: direction)! + 1) % 4]
                }

                switch (direction) {
                    case Dir.left:
                        x -= 1
                    case Dir.right:
                        x += 1
                    case Dir.up:
                        y -= 1
                    case Dir.down:
                        y += 1
                }
            }

            colorMode = !colorMode
            pc += 2
        case 5:
            if param(prog: prog, pc: pc, rb: rb, instr: instr, n: 1) != 0 {
                pc = param(prog: prog, pc: pc, rb: rb, instr: instr, n: 2)
            } else {
                pc += 3
            }
        case 6:
            if param(prog: prog, pc: pc, rb: rb, instr: instr, n: 1) == 0 {
                pc = param(prog: prog, pc: pc, rb: rb, instr: instr, n: 2)
            } else {
                pc += 3
            }
        case 7:
            let idx = store(prog: prog, pc: pc, rb: rb, instr: instr, n: 3)
            if (
                    param(prog: prog, pc: pc, rb: rb, instr: instr, n: 1) <
                    param(prog: prog, pc: pc, rb: rb, instr: instr, n: 2)
            ) {
                prog[idx] = 1
            } else {
                prog[idx] = 0
            }
            pc += 4
        case 8:
            let idx = store(prog: prog, pc: pc, rb: rb, instr: instr, n: 3)
            if (
                    param(prog: prog, pc: pc, rb: rb, instr: instr, n: 1) ==
                    param(prog: prog, pc: pc, rb: rb, instr: instr, n: 2)
            ) {
                prog[idx] = 1
            } else {
                prog[idx] = 0
            }
            pc += 4
        case 9:
            rb += param(prog: prog, pc: pc, rb: rb, instr: instr, n: 1)
            pc += 2
        default:
            assert(false, "unreachable!")
    }
}
