import argparse
import itertools
from typing import Generator
from typing import List
from typing import Optional

import pytest

from support import timing


def run(prog: List[int], n: int) -> Generator[Optional[int], int, None]:
    read_n = False

    def parameter(instr: int, n: int) -> int:
        mode = instr // (10 ** (n + 1)) % 10
        if mode == 0:
            return prog[prog[pc + n]]
        elif mode == 1:
            return prog[pc + n]
        else:
            raise NotImplementedError(mode)

    pc = 0
    while pc < len(prog):
        instr = prog[pc]
        opc = instr % 100
        if opc == 99:
            return
        elif opc == 1:
            prog[prog[pc + 3]] = parameter(instr, 1) + parameter(instr, 2)
            pc += 4
        elif opc == 2:
            prog[prog[pc + 3]] = parameter(instr, 1) * parameter(instr, 2)
            pc += 4
        elif opc == 3:
            if not read_n:
                prog[prog[pc + 1]] = n
                read_n = True
            else:
                prog[prog[pc + 1]] = yield None
            pc += 2
        elif opc == 4:
            yield parameter(instr, 1)
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
                prog[prog[pc + 3]] = 1
            else:
                prog[prog[pc + 3]] = 0
            pc += 4
        elif opc == 8:
            if parameter(instr, 1) == parameter(instr, 2):
                prog[prog[pc + 3]] = 1
            else:
                prog[prog[pc + 3]] = 0
            pc += 4
        else:
            raise AssertionError(f'unreachable? {prog} {pc}')
    raise AssertionError(f'unreachable? {prog} {pc}')


def compute(s: str) -> int:
    prog = [int(part) for part in s.strip().split(',')]
    outputs = []
    for permutation in itertools.permutations(range(5, 10)):
        progs = [run(prog[:], n) for n in permutation]
        progs_cycle = itertools.cycle(progs)

        val = 0
        try:
            while True:
                prog_gen = next(progs_cycle)
                retrieved = next(prog_gen)
                assert retrieved is None
                retrieved = prog_gen.send(val)
                assert isinstance(retrieved, int)
                val = retrieved
        except StopIteration:
            outputs.append(val)

        outputs.append(val)

    return max(outputs)


@pytest.mark.parametrize(
    ('input_s', 'expected'),
    (
        (
            '3,26,1001,26,-4,26,3,27,1002,27,2,27,1,27,26,27,4,27,1001,28,-1,'
            '28,1005,28,6,99,0,0,5',
            139629729,
        ),
    ),
)
def test(input_s: str, expected: int) -> None:
    assert compute(input_s) == expected


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument('data_file')
    args = parser.parse_args()

    with open(args.data_file) as f, timing():
        print(compute(f.read()))

    return 0


if __name__ == '__main__':
    exit(main())
