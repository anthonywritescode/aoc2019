import argparse
import collections
from typing import Callable
from typing import Dict

from support import timing


def run(
        prog: Dict[int, int],
        in_fn: Callable[[], int],
        out_fn: Callable[[int], None],
) -> None:
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
            prog[store(instr, 1)] = in_fn()
            pc += 2
        elif opc == 4:
            out_fn(parameter(instr, 1))
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


def compute(s: str) -> int:
    prog = [int(part) for part in s.strip().split(',')]
    prog_d = collections.defaultdict(int, enumerate(prog))

    grid: Dict[int, Dict[int, str]] = collections.defaultdict(lambda: {})

    def in_fn() -> int:
        raise AssertionError('unreachable')

    y = 0
    x = 0

    def out_fn(n: int) -> None:
        nonlocal x
        nonlocal y

        s = chr(n)
        if s == '\n':
            x = 0
            y += 1
        else:
            grid[y][x] = s
            x += 1

    run(prog_d, in_fn, out_fn)

    def is_intersection(y_coord: int, x_coord: int) -> bool:
        return (
            grid[y_coord][x_coord] == '#' and
            y_coord > 0 and
            x_coord > 0 and
            y_coord < len(grid) - 1 and
            x_coord < len(grid[0]) - 1 and
            grid[y_coord - 1][x_coord] == '#' and
            grid[y_coord + 1][x_coord] == '#' and
            grid[y_coord][x_coord + 1] == '#' and
            grid[y_coord][x_coord - 1] == '#'
        )

    ret = 0
    for y_coord, row in grid.items():
        for x_coord, s in row.items():
            if is_intersection(y_coord, x_coord):
                ret += y_coord * x_coord

    return ret


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument('data_file')
    args = parser.parse_args()

    with open(args.data_file) as f, timing():
        print(compute(f.read()))

    return 0


if __name__ == '__main__':
    exit(main())
