import argparse
import collections
import enum
from typing import Callable
from typing import Dict
from typing import Tuple

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


Dir = enum.Enum('Dir', 'UP DOWN LEFT RIGHT')
RIGHT = (Dir.UP, Dir.RIGHT, Dir.DOWN, Dir.LEFT)
LEFT = tuple(reversed(RIGHT))


def compute(s: str) -> None:
    prog = [int(part) for part in s.strip().split(',')]
    prog_d = collections.defaultdict(int, enumerate(prog))

    painted: Dict[Tuple[int, int], int] = collections.defaultdict(int)
    painted[(0, 0)] = 1

    direction = Dir.UP
    coord_x = 0
    coord_y = 0
    color_mode = True

    def in_fn() -> int:
        return painted[(coord_x, coord_y)]

    def out_fn(n: int) -> None:
        nonlocal color_mode
        nonlocal direction
        nonlocal coord_x
        nonlocal coord_y
        if color_mode:
            painted[(coord_x, coord_y)] = n
        else:
            if n == 0:
                direction = LEFT[(LEFT.index(direction) + 1) % 4]
            else:
                direction = RIGHT[(RIGHT.index(direction) + 1) % 4]

            if direction == Dir.LEFT:
                coord_x -= 1
            elif direction == Dir.RIGHT:
                coord_x += 1
            elif direction == Dir.UP:
                coord_y -= 1
            else:
                coord_y += 1

        color_mode = not color_mode

    run(prog_d, in_fn, out_fn)

    min_x = min(x for x, _ in painted)
    max_x = max(x for x, _ in painted)
    min_y = min(y for _, y in painted)
    max_y = max(y for _, y in painted)

    for y in range(min_y, max_y + 1):
        for x in range(min_x, max_x + 1):
            if painted[(x, y)]:
                print('#', end='')
            else:
                print(' ', end='')
        print()


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument('data_file')
    args = parser.parse_args()

    with open(args.data_file) as f, timing():
        compute(f.read())

    return 0


if __name__ == '__main__':
    exit(main())
