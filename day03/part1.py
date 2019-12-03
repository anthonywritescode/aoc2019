import argparse
from typing import Set
from typing import Tuple

import pytest

from support import timing


def tup_add(tup1: Tuple[int, int], tup2: Tuple[int, int]) -> Tuple[int, int]:
    return tup1[0] + tup2[0], tup1[1] + tup2[1]


DIRECTIONS = {
    'R': (1, 0),
    'L': (-1, 0),
    'U': (0, 1),
    'D': (0, -1),
}


def compute(s: str) -> int:
    wire1, wire2 = s.strip().splitlines()
    intersections = []

    grid: Set[Tuple[int, int]] = set()
    position = (0, 0)
    for part in wire1.split(','):
        direction, magnitude = part[0], int(part[1:])
        direction_tup = DIRECTIONS[direction]
        for _ in range(magnitude):
            position = tup_add(position, direction_tup)
            grid.add(position)

    position = (0, 0)
    for part in wire2.split(','):
        direction, magnitude = part[0], int(part[1:])
        direction_tup = DIRECTIONS[direction]
        for _ in range(magnitude):
            position = tup_add(position, direction_tup)
            if position in grid:
                intersections.append(sum(abs(p) for p in position))

    return min(intersections)


INPUT1 = '''\
R75,D30,R83,U83,L12,D49,R71,U7,L72
U62,R66,U55,R34,D71,R55,D58,R83
'''
INPUT2 = '''\
R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51
U98,R91,D20,R16,D67,R40,U7,R15,U6,R7
'''


@pytest.mark.parametrize(
    ('input_s', 'expected'),
    (
        (INPUT1, 159),
        (INPUT2, 135),
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
