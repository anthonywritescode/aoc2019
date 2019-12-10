import argparse
import math
from typing import NamedTuple
from typing import Tuple

from support import timing


class Coord(NamedTuple):
    x: int
    y: int


def slope_key(slope: Coord) -> Tuple[int, float]:
    if slope.y < 0 and slope.x == 0:
        return (10, 1.)
    elif slope.y < 0 and slope.x > 0:
        return (9, abs(slope.y / slope.x))
    elif slope.x > 0 and slope.y == 0:
        return (8, 1.)
    elif slope.x > 0 and slope.y > 0:
        return (7, abs(slope.x / slope.y))
    elif slope.y > 0 and slope.x == 0:
        return (6, 1.)
    elif slope.y > 0 and slope.x < 0:
        return (5, slope.y / slope.x)
    elif slope.y == 0 and slope.x < 0:
        return (4, 1.)
    else:
        return (3, abs(slope.x / slope.y))


def compute(s: str) -> int:
    coords = set()
    lines = 0
    for y, line in enumerate(s.strip().splitlines()):
        width = len(line)
        lines += 1
        for x, c in enumerate(line):
            if c == '#':
                coords.add(Coord(x, y))

    coord = Coord(x=26, y=28)

    slopes_set = set()
    for x in range(width):
        for y in range(lines):
            if (x, y) == coord:
                continue
            x_diff = x - coord.x
            x_sign = 1 if x_diff >= 0 else -1
            y_diff = y - coord.y
            y_sign = 1 if y_diff >= 0 else -1
            if x_diff == 0:
                y_diff = y_sign * 1
            if y_diff == 0:
                x_diff = x_sign * 1
            gcd = abs(math.gcd(x_diff, y_diff))
            slopes_set.add(Coord(x_diff // gcd, y_diff // gcd))

    slopes = sorted(slopes_set, key=slope_key, reverse=True)

    count = 0
    while True:
        for slope in slopes:
            new_coord = Coord(coord.x + slope.x, coord.y + slope.y)
            while 0 <= new_coord.x < width and 0 <= new_coord.y < lines:
                if new_coord in coords:
                    count += 1
                    coords.remove(new_coord)
                    if count == 200:
                        return 100 * new_coord.x + new_coord.y
                    break
                new_coord = Coord(new_coord.x + slope.x, new_coord.y + slope.y)

    assert False, 'unreachable'


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument('data_file')
    args = parser.parse_args()

    with open(args.data_file) as f, timing():
        print(compute(f.read()))

    return 0


if __name__ == '__main__':
    exit(main())
