from __future__ import annotations

import argparse
import collections
from typing import Generator

import pytest

from support import timing


def adjacent(
        z: int,
        y: int,
        x: int,
) -> Generator[tuple[int, int, int], None, None]:
    # above
    if y == 0:
        yield (z - 1, 1, 2)
    elif y == 3 and x == 2:
        for val in range(5):
            yield (z + 1, 4, val)
    else:
        yield (z, y - 1, x)

    # left
    if x == 0:
        yield (z - 1, 2, 1)
    elif y == 2 and x == 3:
        for val in range(5):
            yield (z + 1, val, 4)
    else:
        yield (z, y, x - 1)

    # down
    if y == 4:
        yield (z - 1, 3, 2)
    elif y == 1 and x == 2:
        for val in range(5):
            yield (z + 1, 0, val)
    else:
        yield (z, y + 1, x)

    # right
    if x == 4:
        yield (z - 1, 2, 3)
    elif y == 2 and x == 1:
        for val in range(5):
            yield (z + 1, val, 0)
    else:
        yield (z, y, x + 1)


def compute(s: str, *, n: int = 200) -> int:
    bugs = set()
    for y, line in enumerate(s.splitlines()):
        for x, c in enumerate(line):
            if c == '#':
                bugs.add((0, y, x))

    for _ in range(n):
        newbugs = set()

        counts: dict[tuple[int, int, int], int] = collections.defaultdict(int)

        for bug in bugs:
            for pos in adjacent(*bug):
                counts[pos] += 1

        for k, v in counts.items():
            if k in bugs and v == 1:
                newbugs.add(k)
            elif k not in bugs and v in (1, 2):
                newbugs.add(k)

        bugs = newbugs

    return len(bugs)


INPUT_S = '''\
....#
#..#.
#..##
..#..
#....
'''


@pytest.mark.parametrize(
    ('input_s', 'expected'),
    (
        (INPUT_S, 99),
    ),
)
def test(input_s: str, expected: int) -> None:
    assert compute(input_s, n=10) == expected


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument('data_file')
    args = parser.parse_args()

    with open(args.data_file) as f, timing():
        print(compute(f.read()))

    return 0


if __name__ == '__main__':
    exit(main())
