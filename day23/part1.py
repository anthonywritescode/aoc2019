from __future__ import annotations

import argparse
import collections
from typing import NamedTuple

from support import timing


class Comp(NamedTuple):
    idx: int
    inputs: collections.deque[int]
    prog: dict[int, int]
    pc: int
    rb: int
    to_send: collections.deque[int]


def run_computer(comp: Comp) -> Comp:
    pc = comp.pc
    rb = comp.rb
    prog = comp.prog
    inputs = comp.inputs
    to_send = comp.to_send

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

    while pc < len(prog):
        instr = prog[pc]
        opc = instr % 100

        if opc == 99:
            raise NotImplementedError('halt???')
        elif opc == 1:
            prog[store(instr, 3)] = parameter(instr, 1) + parameter(instr, 2)
            pc += 4
        elif opc == 2:
            prog[store(instr, 3)] = parameter(instr, 1) * parameter(instr, 2)
            pc += 4
        elif opc == 3:
            if not inputs:
                prog[store(instr, 1)] = -1
            else:
                val = inputs.popleft()
                prog[store(instr, 1)] = val

            pc += 2

            if not inputs:
                return Comp(comp.idx, inputs, prog, pc, rb, to_send)

        elif opc == 4:
            to_send.append(parameter(instr, 1))
            pc += 2

            if len(to_send) == 3:
                return Comp(comp.idx, inputs, prog, pc, rb, to_send)

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
            raise AssertionError(f'unreachable? {pc} {inputs}')
    raise AssertionError(f'unreachable? {pc} {inputs}')


def compute(s: str) -> int:
    prog_l = [int(part) for part in s.strip().split(',')]
    prog_d = collections.defaultdict(int, enumerate(prog_l))

    programs = [
        Comp(
            idx=i,
            inputs=collections.deque([i]),
            prog=prog_d.copy(),
            pc=0,
            rb=0,
            to_send=collections.deque(),
        )
        for i in range(50)
    ]

    while True:
        for i, comp in enumerate(programs):
            programs[i] = run_computer(comp)
            if len(programs[i].to_send) >= 3:
                break

        if len(programs[i].to_send) >= 3:
            target = programs[i].to_send.popleft()
            x = programs[i].to_send.popleft()
            y = programs[i].to_send.popleft()

            if target == 255:
                return y
            else:
                programs[target].inputs.extend((x, y))


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument('data_file')
    args = parser.parse_args()

    with open(args.data_file) as f, timing():
        print(compute(f.read()))

    return 0


if __name__ == '__main__':
    exit(main())
