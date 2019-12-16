import argparse

import pytest

from support import timing


def compute(s: str) -> str:
    ints = [int(c) for c in s.strip()] * 10000
    offset = int(s[:7])
    assert offset > len(ints) // 2, (offset, len(ints))
    ints = ints[offset:]

    for iteration in range(100):
        restsum = sum(ints)
        for i, n in enumerate(ints):
            ints[i] = abs(restsum) % 10
            restsum -= n

    return ''.join(str(n) for n in ints[:8])


@pytest.mark.parametrize(
    ('input_s', 'expected'),
    (
        ('03036732577212944063491565474664', '84462026'),
        ('02935109699940807407585447034323', '78725270'),
        ('03081770884921959731165446850517', '53553731'),

        # put given test cases here
    ),
)
def test(input_s: str, expected: str) -> None:
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
