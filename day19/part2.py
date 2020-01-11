import argparse
import collections
from typing import Dict
from typing import Generator
from typing import List
from typing import NamedTuple

from support import timing


class Prog(NamedTuple):
    prog: Dict[int, int]
    pc: int
    value: int
    halted: bool


def increase_forever(start: int = 0) -> Generator[int, None, None]:
    while True:
        yield start
        start += 1


def run(
        prog: Dict[int, int],
        pc: int,
        inputs: List[int],
) -> Prog:
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
            return Prog(prog, pc, -1, True)
        elif opc == 1:
            prog[store(instr, 3)] = parameter(instr, 1) + parameter(instr, 2)
            pc += 4
        elif opc == 2:
            prog[store(instr, 3)] = parameter(instr, 1) * parameter(instr, 2)
            pc += 4
        elif opc == 3:
            prog[store(instr, 1)] = inputs.pop()
            pc += 2
        elif opc == 4:
            return Prog(prog, pc + 2, parameter(instr, 1), False)
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


def compute(s: str) -> int:
    prog_l = [int(part) for part in s.strip().split(',')]
    prog_d = collections.defaultdict(int, enumerate(prog_l))

    # first search for a vector that will be "in the middle" later on
    for y in increase_forever(start=10):
        in_a_row = 0
        for x in increase_forever():
            if run(prog_d.copy(), 0, [y, x]).value:
                in_a_row += 1
            elif in_a_row:
                break

        if in_a_row >= 3:
            break

    v_y, v_x = y, x - 1

    class Ret(NamedTuple):
        fits: bool
        x: int

    def fits_box(y_pos: int) -> Ret:
        x = int((y_pos / v_y) * v_x)
        assert run(prog_d.copy(), 0, [y_pos, x]).value

        # find the top right corner
        while run(prog_d.copy(), 0, [y_pos, x + 1]).value:
            x += 1

        bl_y = y_pos + 99
        bl_x = x - 99
        fits = bl_x >= 0 and bool(run(prog_d.copy(), 0, [bl_y, bl_x]).value)
        return Ret(fits, x)

    y = 10
    while not fits_box(y).fits:
        y += 1
    return (fits_box(y).x - 99) * 10000 + y


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument('data_file')
    args = parser.parse_args()

    with open(args.data_file) as f, timing():
        print(compute(f.read()))

    return 0


if __name__ == '__main__':
    exit(main())
