import argparse
from typing import NamedTuple

import pytest

from support import timing


class Node(NamedTuple):
    parent: str
    name: str


def compute(s: str) -> int:
    nodes = {'COM': Node('', 'COM')}
    for line in s.splitlines():
        parent, name = line.split(')')
        nodes[name] = Node(parent, name)

    total = 0
    for node in nodes.values():
        while node.name != 'COM':
            total += 1
            node = nodes[node.parent]
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
