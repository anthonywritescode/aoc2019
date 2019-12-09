import math
import os
import sequtils
import strutils
import sugar
import system
import tables

if paramCount() != 1:
    stderr.writeLine("usage: ", paramStr(0), " FILENAME")
    quit(1)

let progL = readFile(os.paramStr(1)).strip().split(',').map(x => parseInt(x))
var prog = initTable[int, int]()
for i, val in progL:
    prog[i] = val
var pc = 0
var rb = 0

proc parameter(instr: int, n: int): int=
    result = case int(instr / (int(10) ^ int(n + 1))) mod 10:
        of 0:
            prog.getOrDefault(prog.getOrDefault(pc + n, 0), 0)
        of 1:
            prog.getOrDefault(pc + n)
        of 2:
            prog.getOrDefault(rb + prog.getOrDefault(pc + n))
        else:
            raiseAssert("unreachable")

proc store(instr: int, n: int): int=
    result = case int(instr / (int(10) ^ int(n + 1))) mod 10:
        of 0:
            prog.getOrDefault(pc + n, 0)
        of 2:
            rb + prog.getOrDefault(pc + n)
        else:
            raiseAssert("unreachable")

while true:
    let instr = prog[pc]
    let opc = instr mod 100
    case opc:
        of 99:
            quit(0)
        of 1:
            prog[store(instr, 3)] = parameter(instr, 1) + parameter(instr, 2)
            pc += 4
        of 2:
            prog[store(instr, 3)] = parameter(instr, 1) * parameter(instr, 2)
            pc += 4
        of 3:
            prog[store(instr, 1)] = 1  # the hardcoded input
            pc += 2
        of 4:
            echo parameter(instr, 1)
            pc += 2
        of 5:
            if parameter(instr, 1) != 0:
                pc = parameter(instr, 2)
            else:
                pc += 3
        of 6:
            if parameter(instr, 1) == 0:
                pc = parameter(instr, 2)
            else:
                pc += 3
        of 7:
            if parameter(instr, 1) < parameter(instr, 2):
                prog[store(instr, 3)] = 1
            else:
                prog[store(instr, 3)] = 0
            pc += 4
        of 8:
            if parameter(instr, 1) == parameter(instr, 2):
                prog[store(instr, 3)] = 1
            else:
                prog[store(instr, 3)] = 0
            pc += 4
        of 9:
            rb += parameter(instr, 1)
            pc += 2
        else:
            raiseAssert("unreachable")
