from __future__ import annotations

import argparse

import pytest

from support import timing


def checksum(bugs: set[tuple[int, int]]) -> int:
    n = 0
    for y, x in bugs:
        n |= 1 << (y * 5 + x)
    return n


def compute(s: str) -> int:
    seen = set()

    bugs = set()
    for y, line in enumerate(s.splitlines()):
        for x, c in enumerate(line):
            if c == '#':
                bugs.add((y, x))

    seen = {checksum(bugs)}

    while True:
        newbugs = set()
        for y in range(5):
            for x in range(5):
                n_bugs = 0
                cs = ((y, x + 1), (y, x - 1), (y + 1, x), (y - 1, x))
                for c_y, c_x in cs:
                    if (c_y, c_x) in bugs:
                        n_bugs += 1

                if (y, x) in bugs and n_bugs == 1:
                    newbugs.add((y, x))
                elif (y, x) not in bugs and n_bugs in (1, 2):
                    newbugs.add((y, x))

        new_cs = checksum(newbugs)
        if new_cs in seen:
            return new_cs
        else:
            seen.add(new_cs)
            bugs = newbugs


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
        (INPUT_S, 2129920),
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
