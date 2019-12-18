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


DIRECTIONS = [(0, -1), (1, 0), (0, 1), (-1, 0)]


def add_coord(p1: Tuple[int, int], p2: Tuple[int, int]) -> Tuple[int, int]:
    return p1[0] + p2[0], p1[1] + p2[1]


def get_path(
        grid: Dict[Tuple[int, int], str],
        pos: Tuple[int, int],
) -> List[str]:
    assert grid[pos] == '^'
    direction = DIRECTIONS[0]
    ret: List[str] = []
    n = 0

    while '#' in grid.values():
        pos_idx = DIRECTIONS.index(direction)
        right_dir = DIRECTIONS[(pos_idx + 1) % 4]
        left_dir = DIRECTIONS[(pos_idx - 1) % 4]
        next_straight = add_coord(pos, direction)
        next_right = add_coord(pos, right_dir)
        next_left = add_coord(pos, left_dir)
        if grid[next_straight] in {'#', 'X'}:
            n += 1
            pos = next_straight
            grid[pos] = 'X'
        elif grid[next_right] == '#':
            ret.extend((str(n), 'R'))
            n = 0
            direction = right_dir
        else:
            assert grid[next_left] == '#'
            ret.extend((str(n), 'L'))
            n = 0
            direction = left_dir

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
    assert get_path(grid, (bot_x, bot_y)) == [
        'R', '8', 'R', '8', 'R', '4', 'R', '4', 'R', '8', 'L', '6', 'L', '2',
        'R', '4', 'R', '4', 'R', '8', 'R', '8', 'R', '8', 'L', '6', 'L', '2',
    ]


def possible_strings(
        s: str,
        s_idx: int,
        prev: Tuple[str, ...],
) -> List[Tuple[str, int]]:
    e_idx = s_idx

    while True:
        for prev_s in prev:
            if s.startswith(prev_s, s_idx):
                s_idx = e_idx = s_idx + len(prev_s) + 1
                break
        else:
            break

    ret = []
    while True:
        e_idx = s.find(',', e_idx + 1)
        e_idx = s.find(',', e_idx + 1)
        if s.count(s[s_idx:e_idx]) == 1 or e_idx - s_idx > 20:
            break
        else:
            ret.append((s[s_idx:e_idx], e_idx + 1))
    return ret


def get_prog(prog: List[str]) -> str:
    s = ','.join(prog)

    possible = []
    for s1, s1_e in possible_strings(s, 0, ()):
        for s2, s2_e in possible_strings(s, s1_e, (s1,)):
            for s3, s3_e in possible_strings(s, s2_e, (s1, s2)):
                possible.append((s1, s2, s3))

    for ret_strings in possible:
        main = []
        s_try = s
        while s_try:
            for i, routine in enumerate(ret_strings):
                if s_try.startswith(routine):
                    s_try = s_try[len(routine) + 1:]
                    main.append(chr(ord('A') + i))
                    break
            else:
                break
        else:
            if len(','.join(main)) < 20:
                return '\n'.join((','.join(main), *ret_strings, 'n', ''))
    else:
        raise AssertionError('unreachable')


def test_get_prog() -> None:
    input_actions = [
        'R', '8', 'R', '8', 'R', '4', 'R', '4', 'R', '8', 'L', '6', 'L', '2',
        'R', '4', 'R', '4', 'R', '8', 'R', '8', 'R', '8', 'L', '6', 'L', '2',
    ]
    # given answer as this, but ours also works :shrug:
    # A,B,C,B,A,C
    # R,8,R,8
    # R,4,R,4,R,8
    # L,6,L,2
    # n
    assert get_prog(input_actions) == '''\
A,A,B,A,C,B,A,A,A,C
R,8
R,4,R,4
L,6,L,2
n
'''


def test_get_prog2() -> None:
    input_actions = [
        'L', '4', 'R', '8', 'L', '6', 'L', '10', 'L', '6', 'R', '8',
        'R', '10', 'L', '6', 'L', '6', 'L', '4', 'R', '8', 'L', '6',
        'L', '10', 'L', '6', 'R', '8', 'R', '10', 'L', '6', 'L', '6',
        'L', '4', 'L', '4', 'L', '10', 'L', '4', 'L', '4', 'L', '10',
        'L', '6', 'R', '8', 'R', '10', 'L', '6', 'L', '6', 'L', '4',
        'R', '8', 'L', '6', 'L', '10', 'L', '6', 'R', '8', 'R', '10',
        'L', '6', 'L', '6', 'L', '4', 'L', '4', 'L', '10',
    ]
    assert get_prog(input_actions) == '''\
A,B,A,B,C,C,B,A,B,C
L,4,R,8,L,6,L,10
L,6,R,8,R,10,L,6,L,6
L,4,L,4,L,10
n
'''


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

    computed = False
    machine_prog = iter('')

    def in_fn() -> int:
        nonlocal computed
        nonlocal machine_prog

        if not computed:
            assert bot_x != 0, bot_x
            assert bot_y != 0, bot_y
            assert grid[bot_x, bot_y] == '^', grid[bot_x, bot_y]
            path = get_path(grid, (bot_x, bot_y))
            machine_prog = iter(get_prog(path))
            computed = True

        return ord(next(machine_prog))

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
