import argparse
import collections
from typing import Callable
from typing import Dict
from typing import List
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


def print_grid(grid: Dict[Tuple[int, int], str]) -> None:
    min_x = min(x for x, _ in grid)
    max_x = max(x for x, _ in grid)
    min_y = min(y for _, y in grid)
    max_y = max(y for _, y in grid)
    for y in range(min_y, max_y + 1):
        for x in range(min_x, max_x + 1):
            print(grid[x, y], end='')
        print()
    print('=' * 79)


def get_path(
        grid: Dict[Tuple[int, int], str],
        bot_x: int,
        bot_y: int,
) -> List[str]:
    direction = grid[bot_x, bot_y]
    ret: List[str] = []
    n = 0

    while '#' in grid.values():
        grid[bot_x, bot_y] = 'X'
        if direction == '^':
            if grid[bot_x, bot_y - 1] in {'#', 'X'}:
                n += 1
                bot_y -= 1
                grid[bot_x, bot_y] = 'X'
            elif grid[bot_x + 1, bot_y] == '#':
                ret.extend((str(n), 'R'))
                n = 0
                direction = '>'
            else:
                assert grid[bot_x - 1, bot_y] == '#'
                ret.extend((str(n), 'L'))
                n = 0
                direction = '<'
        elif direction == '<':
            if grid[bot_x - 1, bot_y] in {'#', 'X'}:
                n += 1
                bot_x -= 1
                grid[bot_x, bot_y] = 'X'
            elif grid[bot_x, bot_y - 1] == '#':
                ret.extend((str(n), 'R'))
                n = 0
                direction = '^'
            else:
                assert grid[bot_x, bot_y + 1] == '#'
                ret.extend((str(n), 'L'))
                n = 0
                direction = 'v'

        elif direction == '>':
            if grid[bot_x + 1, bot_y] in {'#', 'X'}:
                n += 1
                bot_x += 1
                grid[bot_x, bot_y] = 'X'
            elif grid[bot_x, bot_y + 1] == '#':
                ret.extend((str(n), 'R'))
                n = 0
                direction = 'v'
            else:
                assert grid[bot_x, bot_y - 1] == '#'
                ret.extend((str(n), 'L'))
                n = 0
                direction = '^'

        else:
            assert direction == 'v'

            if grid[bot_x, bot_y + 1] in {'#', 'X'}:
                n += 1
                bot_y += 1
                grid[bot_x, bot_y] = 'X'
            elif grid[bot_x - 1, bot_y] == '#':
                ret.extend((str(n), 'R'))
                n = 0
                direction = '<'
            else:
                assert grid[bot_x + 1, bot_y] == '#'
                ret.extend((str(n), 'L'))
                n = 0
                direction = '>'

    ret.append(str(n))
    return ret[1:]


INPUT = '''\
#######...#####
#.....#...#...#
#.....#...#...#
......#...#...#
......#...###.#
......#.....#.#
^########...#.#
......#.#...#.#
......#########
........#...#..
....#########..
....#...#......
....#...#......
....#...#......
....#####......
'''


def test_get_path() -> None:
    bot_x = 0
    bot_y = 0
    grid: Dict[Tuple[int, int], str] = collections.defaultdict(str)
    for y, row in enumerate(INPUT.splitlines()):
        for x, s in enumerate(row):
            grid[x, y] = s
            if s == '^':
                bot_x = x
                bot_y = y
    assert get_path(grid, bot_x, bot_y) == [
        'R', '8', 'R', '8', 'R', '4', 'R', '4', 'R', '8', 'L', '6', 'L', '2',
        'R', '4', 'R', '4', 'R', '8', 'R', '8', 'R', '8', 'L', '6', 'L', '2',
    ]


def compute(s: str) -> int:
    prog = [int(part) for part in s.strip().split(',')]
    prog_d = collections.defaultdict(int, enumerate(prog))
    prog_d[0] = 2

    grid: Dict[Tuple[int, int], str] = collections.defaultdict(str)

    answer = 0
    y = 0
    x = 0
    bot_x = 0
    bot_y = 0

    # these were determined by hand :'(
    PROG = iter('''\
C,A,C,A,B,B,A,C,A,B
L,6,R,8,R,10,L,6,L,6
L,4,L,4,L,10
L,4,R,8,L,6,L,10
n
''')

    def in_fn() -> int:
        assert bot_x != 0, bot_x
        assert bot_y != 0, bot_y
        assert grid[bot_x, bot_y] == '^', grid[bot_x, bot_y]
        return ord(next(PROG))

    def out_fn(n: int) -> None:
        nonlocal answer
        nonlocal x
        nonlocal y
        nonlocal bot_x
        nonlocal bot_y

        if n < 255:
            s = chr(n)
            if s == '\n':
                x = 0
                y += 1
            else:
                if s == '^':
                    bot_x = x
                    bot_y = y
                grid[x, y] = s
                x += 1
        else:
            answer = n

    run(prog_d, in_fn, out_fn)

    return answer


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument('data_file')
    args = parser.parse_args()

    with open(args.data_file) as f, timing():
        print(compute(f.read()))

    return 0


if __name__ == '__main__':
    exit(main())
