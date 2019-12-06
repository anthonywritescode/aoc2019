import argparse
from typing import Dict

import pytest

from support import timing


def compute(s: str) -> int:
    nodes = {'COM': ''}
    for line in s.splitlines():
        parent, name = line.split(')')
        nodes[name] = parent

    you_hops: Dict[str, int] = {}
    node = nodes['YOU']
    i = 0
    while node != 'COM':
        i += 1
        you_hops[node] = i
        node = nodes[node]

    san_hops: Dict[str, int] = {}
    node = nodes['SAN']
    i = 0
    while node != 'COM':
        i += 1
        san_hops[node] = i
        node = nodes[node]

    candidates = [
        (you_hops[k] + san_hops[k], k)
        for k in you_hops.keys() & san_hops.keys()
    ]

    n, el = min(candidates)
    return n - 2


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
K)YOU
I)SAN
'''


@pytest.mark.parametrize(
    ('input_s', 'expected'),
    (
        (INPUT, 4),
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
