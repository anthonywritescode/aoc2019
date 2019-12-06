import argparse

import pytest

from support import timing


def compute(s: str) -> int:
    nodes = {'COM': ''}
    for line in s.splitlines():
        parent, name = line.split(')')
        nodes[name] = parent

    # TODO: cache the loopup
    total = 0
    for node in nodes.values():
        while node != '':
            total += 1
            node = nodes[node]
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
