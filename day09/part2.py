import argparse
import collections
from typing import Callable
from typing import Dict

from support import timing

# 99 -> halt
# 1 -> read from 2 positions, add and store in third
#   (positions are directly after)
# 2 -> mult
# jump forward 4 after progessing
"""\
Opcode 3 takes a single integer as input and saves it to the address given
by its only parameter. For example, the instruction 3,50 would take an input
value and store it at address 50.
Opcode 4 outputs the value of its only parameter. For example, the
instruction 4,50 would output the value at address 50.

Opcode 5 is jump-if-true: if the first parameter is non-zero, it sets the
instruction pointer to the value from the second parameter. Otherwise, it
does nothing.
Opcode 6 is jump-if-false: if the first parameter is zero, it sets the
instruction pointer to the value from the second parameter. Otherwise, it
does nothing.
Opcode 7 is less than: if the first parameter is less than the second
parameter, it stores 1 in the position given by the third parameter.
Otherwise, it stores 0.
Opcode 8 is equals: if the first parameter is equal to the second parameter,
it stores 1 in the position given by the third parameter. Otherwise, it
stores 0.
"""


def run(prog: Dict[int, int], fn: Callable[[int], None]) -> None:
    def parameter(instr: int, n: int) -> int:
        mode = instr // (10 ** (n + 1)) % 10
        if mode == 0:
            return prog[prog[pc + n]]
        elif mode == 1:
            return prog[pc + n]
        elif mode == 2:
            return prog[rb + prog[pc + n]]
        else:
            raise NotImplementedError(mode)

    def store(instr: int, n: int) -> int:
        mode = instr // (10 ** (n + 1)) % 10
        if mode == 0:
            return prog[pc + n]
        elif mode == 2:
            return rb + prog[pc + n]
        else:
            raise NotImplementedError(mode)

    rb = 0
    pc = 0
    while pc < len(prog):
        instr = prog[pc]
        opc = instr % 100
        if opc == 99:
            return
        elif opc == 1:
            prog[store(instr, 3)] = parameter(instr, 1) + parameter(instr, 2)
            pc += 4
        elif opc == 2:
            prog[store(instr, 3)] = parameter(instr, 1) * parameter(instr, 2)
            pc += 4
        elif opc == 3:
            prog[store(instr, 1)] = 2  # the hardcoded input
            pc += 2
        elif opc == 4:
            fn(parameter(instr, 1))
            pc += 2
        elif opc == 5:
            if parameter(instr, 1):
                pc = parameter(instr, 2)
            else:
                pc += 3
        elif opc == 6:
            if not parameter(instr, 1):
                pc = parameter(instr, 2)
            else:
                pc += 3
        elif opc == 7:
            if parameter(instr, 1) < parameter(instr, 2):
                prog[store(instr, 3)] = 1
            else:
                prog[store(instr, 3)] = 0
            pc += 4
        elif opc == 8:
            if parameter(instr, 1) == parameter(instr, 2):
                prog[store(instr, 3)] = 1
            else:
                prog[store(instr, 3)] = 0
            pc += 4
        elif opc == 9:
            rb += parameter(instr, 1)
            pc += 2
        else:
            raise AssertionError(f'unreachable? {prog} {pc}')
    raise AssertionError(f'unreachable? {prog} {pc}')


def compute(s: str) -> None:
    prog = [int(part) for part in s.strip().split(',')]
    prog_d = collections.defaultdict(int, enumerate(prog))
    run(prog_d, print)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument('data_file')
    args = parser.parse_args()

    with open(args.data_file) as f, timing():
        compute(f.read())

    return 0


if __name__ == '__main__':
    exit(main())
