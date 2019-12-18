import argparse
import collections
from typing import Dict
from typing import FrozenSet
from typing import Generator
from typing import List
from typing import Set
from typing import Tuple

import pytest

from support import timing


def next_pos(pos: Tuple[int, int]) -> Generator[Tuple[int, int], None, None]:
    x, y = pos
    yield x + 1, y
    yield x - 1, y
    yield x, y + 1
    yield x, y - 1


def compute(s: str) -> int:
    grid: Dict[Tuple[int, int], str] = collections.defaultdict(str)
    key_count = 0
    for y, line in enumerate(s.splitlines()):
        for x, c in enumerate(line):
            grid[x, y] = c
            if c == '@':
                pos = (x, y)
            elif c.islower():
                key_count += 1

    visited: Set[Tuple[FrozenSet[str], Tuple[int, int]]] = {(frozenset(), pos)}

    states: List[Tuple[FrozenSet[str], Tuple[int, int], int]]
    states = [(frozenset(), pos, 0)]
    while True:
        states_next = []
        for keys, pos, steps in states:
            for cand in next_pos(pos):
                c = grid[cand]
                if cand not in grid:
                    continue
                elif (keys, cand) in visited:
                    continue
                elif c == '#':
                    continue
                elif c.isupper() and c.lower() not in keys:
                    continue

                if c.islower() and c not in keys:
                    cand_keys = keys | {c}
                else:
                    cand_keys = keys
                visited.add((keys, cand))
                states_next.append((cand_keys, cand, steps + 1))

                if len(keys) == key_count:
                    return steps

        states = states_next
    raise AssertionError('unreachable')


INPUT1 = '''\
#########
#b.A.@.a#
#########
'''
INPUT2 = '''\
########################
#f.D.E.e.C.b.A.@.a.B.c.#
######################.#
#d.....................#
########################
'''
INPUT3 = '''\
########################
#...............b.C.D.f#
#.######################
#.....@.a.B.c.d.A.e.F.g#
########################
'''
INPUT4 = '''\
#################
#i.G..c...e..H.p#
########.########
#j.A..b...f..D.o#
########@########
#k.E..a...g..B.n#
########.########
#l.F..d...h..C.m#
#################
'''


@pytest.mark.parametrize(
    ('input_s', 'expected'),
    (
        (INPUT1, 8),
        (INPUT2, 86),
        (INPUT3, 132),
        (INPUT4, 136),
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
