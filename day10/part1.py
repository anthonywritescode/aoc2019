import argparse
import math
from typing import NamedTuple

import pytest

from support import timing


class Coord(NamedTuple):
    x: int
    y: int


def compute(s: str) -> int:
    coords = set()
    for y, line in enumerate(s.strip().splitlines()):
        for x, c in enumerate(line):
            if c == '#':
                coords.add(Coord(x, y))

    counts = []
    for coord in coords:
        count = 0
        for other_coord in coords:
            if coord == other_coord:
                continue
            x_diff = other_coord.x - coord.x
            x_sign = 1 if x_diff >= 0 else -1
            y_diff = other_coord.y - coord.y
            y_sign = 1 if y_diff >= 0 else -1
            if x_diff == 0:
                y_diff = y_sign * 1
            if y_diff == 0:
                x_diff = x_sign * 1
            gcd = abs(math.gcd(x_diff, y_diff))
            slope = Coord(x_diff // gcd, y_diff // gcd)

            new = Coord(coord.x + slope.x, coord.y + slope.y)
            while new != other_coord:
                if new in coords:
                    break
                new = Coord(new.x + slope.x, new.y + slope.y)
            else:
                count += 1
        counts.append((count, coord))

    max_val, _ = max(counts)
    return max_val


INPUT1 = '''\
......#.#.
#..#.#....
..#######.
.#.#.###..
.#..#.....
..#....#.#
#..#....#.
.##.#..###
##...#..#.
.#....####
'''


@pytest.mark.parametrize(
    ('input_s', 'expected'),
    (
        (INPUT1, 33),
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
