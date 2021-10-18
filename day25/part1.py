import argparse
import collections
import itertools
from typing import Callable
from typing import Dict
from typing import Generator

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


GET_ALL_ITEMS = '''\
east
north
north
take spool of cat6
south
east
take mug
north
north
west
take asterisk
east
south
east
take sand
east
south
take tambourine
west
take festive hat
east
north
west
south
west
take prime number
east
north
west
south
west
east
north
north
west
south
take monolith
north
east
south
east
east
south
west
north
'''

items = (
    'asterisk',
    'festive hat',
    'mug',
    'prime number',
    'sand',
    'spool of cat6',
    'tambourine',
)


def compute(s: str) -> None:
    prog = [int(part) for part in s.strip().split(',')]
    prog_d = collections.defaultdict(int, enumerate(prog))

    def in_gen() -> Generator[str, None, None]:
        yield from GET_ALL_ITEMS

        # start by dropping all the items
        yield from 'drop monolith\n'
        for item in items:
            yield from f'drop {item}\n'

        for i in range(len(items)):
            for combination in itertools.combinations(items, i):
                for item in combination:
                    yield from f'take {item}\n'

                yield from 'west\n'

                for item in combination:
                    yield from f'drop {item}\n'

    buffer = in_gen()

    def in_fn() -> int:
        return ord(next(buffer))

        # debugging:
        # nonlocal buffer
        # try:
        #     return ord(next(buffer))
        # except StopIteration:
        #     buffer = iter(f'{input()}\n')
        #     return ord(next(buffer))

    prev = ''
    printing = False

    def out_fn(n: int) -> None:
        nonlocal prev, printing
        char = chr(n)

        if prev == '\n' and char == '"':
            printing = True

        prev = char

        if printing:
            print(char, end='')

    run(prog_d, in_fn, out_fn)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument('data_file')
    args = parser.parse_args()

    with open(args.data_file) as f, timing():
        compute(f.read())

    return 0


if __name__ == '__main__':
    exit(main())
