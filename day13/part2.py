import argparse
import collections
import curses
import hashlib
import os
import time
from typing import Callable
from typing import Dict
from typing import List
from typing import Tuple
from typing import Union

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


KEYS: Dict[Union[int, str], int] = {curses.KEY_LEFT: -1, curses.KEY_RIGHT: 1}
TILES = {0: ' ', 1: '█', 2: '▦', 3: '▂', 4: '○'}


def c_main(stdscr: 'curses._CursesWindow', prog_d: Dict[int, int]) -> int:
    board: Dict[Tuple[int, int], int] = collections.defaultdict(int)
    read_queue: List[int] = []
    score = 0
    ball_pos = 0
    paddle_pos = 0

    def draw_score(val: int) -> None:
        nonlocal score
        score = val
        stdscr.addstr(curses.LINES - 1, 0, f'score: {score}')

    def in_fn() -> int:
        if os.environ.get('MODE') == 'manual':
            return KEYS.get(stdscr.get_wch(), 0)
        elif os.environ.get('MODE') == 'fast':
            stdscr.refresh()
            time.sleep(.001)
        elif os.environ.get('MODE') == 'normal':
            stdscr.refresh()
            time.sleep(.05)
        if ball_pos > paddle_pos:
            return 1
        elif ball_pos == paddle_pos:
            return 0
        else:
            return -1

    def out_fn(n: int) -> None:
        nonlocal ball_pos
        nonlocal paddle_pos

        read_queue.append(n)
        if len(read_queue) == 3:
            x, y, val = read_queue
            if (x, y) == (-1, 0):
                draw_score(val)
            else:
                board[x, y] = val
                if val == 2:
                    pair = hashlib.sha256(f'{x}{y}'.encode()).digest()[0] % 16
                    color = curses.color_pair(pair)
                else:
                    color = 0

                if val == 4:
                    ball_pos = x
                elif val == 3:
                    paddle_pos = x
                stdscr.addstr(y, x, TILES[val], color)
            read_queue.clear()

    prog_d[0] = 2
    draw_score(0)
    curses.curs_set(0)
    curses.use_default_colors()
    for color in range(1, 16):
        curses.init_pair(color, color, -1)
    run(prog_d, in_fn, out_fn)
    return score


def compute(s: str) -> int:
    prog = [int(part) for part in s.strip().split(',')]
    prog_d = collections.defaultdict(int, enumerate(prog))
    return curses.wrapper(c_main, prog_d)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument('data_file')
    args = parser.parse_args()

    with open(args.data_file) as f, timing():
        print(compute(f.read()))

    return 0


if __name__ == '__main__':
    exit(main())
