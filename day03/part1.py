import argparse
import bisect
from typing import Callable
from typing import List
from typing import NamedTuple
from typing import Optional
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

    grid: Set[Tuple[int, int]] = set()

    def save_to_grid(position: Tuple[int, int]) -> None:
        grid.add(position)

    trace_wire(wire1, save_to_grid)

    def collect_distance_at_intersection(position: Tuple[int, int]) -> None:
        if position in grid:
            intersections.append(sum(abs(p) for p in position))

    trace_wire(wire2, collect_distance_at_intersection)

    return min(intersections)


class Vector(NamedTuple):
    s_x: int
    s_y: int
    e_x: int
    e_y: int

    @property
    def min_x(self) -> int:
        return min(self.s_x, self.e_x)

    @property
    def max_x(self) -> int:
        return max(self.s_x, self.e_x)

    @property
    def min_y(self) -> int:
        return min(self.s_y, self.e_y)

    @property
    def max_y(self) -> int:
        return max(self.s_y, self.e_y)

    @property
    def vertical(self) -> bool:
        return self.s_x == self.e_x

    def intersects(self, other: 'Vector') -> Optional[Tuple[int, int]]:
        if self.vertical == other.vertical:
            return None
        elif (
                self.vertical and
                other.min_x <= self.s_x <= other.max_x and
                self.min_y <= other.s_y <= self.max_y
        ):
            return (self.s_x, other.s_y)
        elif (
                not self.vertical and
                self.min_x <= other.s_x <= self.max_x and
                other.min_y <= self.s_y <= other.max_y
        ):
            return (other.s_x, self.s_y)
        else:
            return None


def vectorize(s: str) -> Tuple[List[Vector], List[Vector]]:
    ret_v, ret_h = [], []
    x = y = 0
    for part in s.split(','):
        prev_x, prev_y = x, y
        direction, magnitude = part[0], int(part[1:])
        if direction == 'R':
            x += magnitude
        elif direction == 'L':
            x -= magnitude
        elif direction == 'U':
            y += magnitude
        elif direction == 'D':
            y -= magnitude
        vec = Vector(prev_x, prev_y, x, y)
        if vec.vertical:
            ret_v.append(vec)
        else:
            ret_h.append(vec)
    ret_v.sort(key=lambda vec: vec.s_x)
    ret_h.sort(key=lambda vec: vec.s_y)
    return ret_v, ret_h


def compute_vectorize(s: str) -> int:
    wire1, wire2 = s.strip().splitlines()
    vec_v1, vec_h1 = vectorize(wire1)
    vec_v1_x = [vec.s_x for vec in vec_v1]
    vec_h1_y = [vec.s_y for vec in vec_h1]
    vec_v2, vec_h2 = vectorize(wire2)

    distances = []

    for vvec in vec_v2:
        i = bisect.bisect_left(vec_h1_y, vvec.min_y)
        while i < len(vec_h1) and vec_h1[i].s_y <= vvec.max_y:
            intersect = vvec.intersects(vec_h1[i])
            if intersect:
                distances.append(abs(intersect[0]) + abs(intersect[1]))
            i += 1

    for hvec in vec_h2:
        i = bisect.bisect_left(vec_v1_x, hvec.min_x)
        while i < len(vec_v1) and vec_v1[i].s_x <= vvec.max_x:
            intersect = hvec.intersects(vec_v1[i])
            if intersect:
                distances.append(abs(intersect[0]) + abs(intersect[1]))
            i += 1

    return min(distances[1:])


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
@pytest.mark.parametrize('func', (compute, compute_vectorize))
def test(input_s: str, expected: int, func: Callable[[str], int]) -> None:
    assert func(input_s) == expected


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument('data_file')
    args = parser.parse_args()

    with open(args.data_file) as f, timing('original'):
        print(compute(f.read()))

    with open(args.data_file) as f, timing('vector collision'):
        print(compute(f.read()))

    return 0


if __name__ == '__main__':
    exit(main())
