import argparse
import collections
import sys
from typing import Callable
from typing import Dict
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


def trace_wire(wire: str, callback: Callable[[Tuple[int, int]], None]) -> None:
    position = (0, 0)
    for part in wire.split(','):
        direction, magnitude = part[0], int(part[1:])
        direction_tup = DIRECTIONS[direction]
        for _ in range(magnitude):
            position = tup_add(position, direction_tup)
            callback(position)


def compute(s: str) -> int:
    wire1, wire2 = s.strip().splitlines()
    intersections = []

    grid: Dict[Tuple[int, int], int]
    grid = collections.defaultdict(lambda: sys.maxsize)

    i = 0

    def record_minimum_position(position: Tuple[int, int]) -> None:
        nonlocal i
        i += 1
        grid[position] = min(grid[position], i)

    trace_wire(wire1, record_minimum_position)

    i = 0

    def record_intersection_actions(position: Tuple[int, int]) -> None:
        nonlocal i
        i += 1
        if position in grid:
            intersections.append(grid[position] + i)

    trace_wire(wire2, record_intersection_actions)

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
        (INPUT1, 610),
        (INPUT2, 410),
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
