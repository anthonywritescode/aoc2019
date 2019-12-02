import argparse
from typing import List

import pytest

from support import timing

# 99 -> halt
# 1 -> read from 2 positions, add and store in third
#   (positions are directly after)
# 2 -> mult
# jump forward 4 after processing


def compute_not_broken(prog: List[int]) -> int:
    pc = 0
    while True:
        opc = prog[pc]
        if opc == 99:
            return prog[0]
        elif opc == 1:
            prog[prog[pc + 3]] = prog[prog[pc + 2]] + prog[prog[pc + 1]]
        elif opc == 2:
            prog[prog[pc + 3]] = prog[prog[pc + 2]] * prog[prog[pc + 1]]
        else:
            raise AssertionError(f'unreachable? {prog} {pc}')
        pc += 4
    return prog[0]


def compute(s: str) -> int:
    prog = [int(part) for part in s.strip().split(',')]
    prog[1] = 12
    prog[2] = 2
    return compute_not_broken(prog)


@pytest.mark.parametrize(
    ('input_l', 'expected'),
    (
        ([1, 0, 0, 0, 99], 2),
    ),
)
def test(input_l: List[int], expected: int) -> None:
    assert compute_not_broken(input_l) == expected


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument('data_file')
    args = parser.parse_args()

    with open(args.data_file) as f, timing():
        print(compute(f.read()))

    return 0


if __name__ == '__main__':
    exit(main())
