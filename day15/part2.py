import argparse
import collections
import sys
from typing import Dict
from typing import NamedTuple
from typing import Optional
from typing import Tuple

from support import timing


class Prog(NamedTuple):
    prog: Dict[int, int]
    pc: int
    value: int
    halted: bool


def run(
        prog: Dict[int, int],
        pc: int,
        value: Optional[int],
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
            assert value is not None
            prog[store(instr, 1)] = value
            value = None
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


# north (1), south (2), west (3), and east (4)
def add_position(pos_x: int, pos_y: int, direction: int) -> Tuple[int, int]:
    if direction == 1:
        pos_y -= 1
    elif direction == 2:
        pos_y += 1
    elif direction == 3:
        pos_x -= 1
    elif direction == 4:
        pos_x += 1
    else:
        raise AssertionError(direction)
    return pos_x, pos_y


def print_map(area: Dict[Tuple[int, int], str]) -> None:
    min_x = min_y = sys.maxsize
    max_x = max_y = -sys.maxsize
    for x, y in area:
        min_x = min(min_x, x)
        max_x = max(max_x, x)
        min_y = min(min_y, y)
        max_y = max(max_y, y)

    for y in range(min_y, max_y + 1):
        for x in range(min_x, max_x + 1):
            print(area.get((x, y), ' '), end='')
        print()
    print('=' * 79)


def compute(s: str) -> int:
    prog_l = [int(part) for part in s.strip().split(',')]
    prog_d = collections.defaultdict(int, enumerate(prog_l))

    oxygen_pos: Optional[Tuple[int, int]] = None
    area: Dict[Tuple[int, int], str] = {}

    programs = [
        (run(prog_d.copy(), 0, direction), add_position(0, 0, direction), 1)
        for direction in (1, 2, 3, 4)
    ]
    while programs:
        next_iter = []
        for prog, pos, depth in programs:
            if prog.value == 0:
                area[pos] = '#'
            elif prog.value in {1, 2}:
                if prog.value == 1:
                    area[pos] = '.'
                else:
                    area[pos] = 'X'
                    oxygen_pos = pos
                for direction in (1, 2, 3, 4):
                    new_pos = add_position(*pos, direction)
                    if new_pos in area:
                        continue
                    else:
                        next_iter.append((
                            run(prog.prog.copy(), prog.pc, direction),
                            new_pos,
                            depth + 1,
                        ))
            else:
                raise AssertionError(prog.value)
        programs = next_iter

    assert oxygen_pos is not None
    to_fill = [oxygen_pos]
    minutes = 0
    while to_fill:
        next_to_fill = []
        for pos in to_fill:
            for direction in (1, 2, 3, 4):
                new_pos = add_position(*pos, direction)
                if area[new_pos] != '.':
                    continue
                area[new_pos] = 'O'
                next_to_fill.append(new_pos)
        to_fill = next_to_fill
        if to_fill:
            minutes += 1
    return minutes


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument('data_file')
    args = parser.parse_args()

    with open(args.data_file) as f, timing():
        print(compute(f.read()))

    return 0


if __name__ == '__main__':
    exit(main())
