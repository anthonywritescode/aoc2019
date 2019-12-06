import argparse
import functools
from typing import Callable

import pytest

from support import timing


def compute_orig(s: str) -> int:
    nodes = {'COM': ''}
    for line in s.splitlines():
        parent, name = line.split(')')
        nodes[name] = parent

    total = 0
    for node in nodes.values():
        while node != '':
            total += 1
            node = nodes[node]
    return total


def compute_memoized(s: str) -> int:
    nodes = {'COM': ''}
    for line in s.splitlines():
        parent, name = line.split(')')
        nodes[name] = parent

    @functools.lru_cache(maxsize=None)
    def size(node: str) -> int:
        if node == '':
            return 0
        else:
            return 1 + size(nodes[node])

    total = 0
    for node in nodes.values():
        total += size(node)
    return total


INPUT = '''\
COM)B
B)C
C)D
D)E
E)F
B)G
G)H
D)I
E)J
J)K
K)L
'''


@pytest.mark.parametrize(
    ('input_s', 'expected'),
    (
        (INPUT, 42),
    ),
)
@pytest.mark.parametrize('fn', (compute_orig, compute_memoized))
def test(input_s: str, expected: int, fn: Callable[[str], int]) -> None:
    assert fn(input_s) == expected


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument('data_file')
    args = parser.parse_args()

    with open(args.data_file) as f, timing('original'):
        print(compute_orig(f.read()))

    with open(args.data_file) as f, timing('memoized'):
        print(compute_memoized(f.read()))

    return 0


if __name__ == '__main__':
    exit(main())
