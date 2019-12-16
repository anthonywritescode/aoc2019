import argparse
import itertools
from typing import Generator
from typing import Sequence

import pytest

from support import timing


PATTERN = (0, 1, 0, -1)


def repeat(pattern: Sequence[int], n: int) -> Generator[int, None, None]:
    for val in pattern:
        for _ in range(n):
            yield val


def compute(s: str) -> str:
    ints = [int(c) for c in s.strip()] * 10000
    offset = int(s[:7])

    for iteration in range(100):
        sums = [ints[-1]]
        for num in reversed(ints[offset:-1]):
            sums.append(sums[-1] + num)
        sums = [0] * offset + list(reversed(sums))

        next_lst = ints[:offset]
        for idx in range(offset, (len(ints) + 1) // 2):
            pattern = itertools.cycle(repeat(PATTERN, idx + 1))
            val = sum(x * y for x, y in zip(ints[idx:], pattern))
            next_lst.append(abs(val) % 10)
        for idx in range(max(offset, (len(ints) + 1) // 2), len(ints)):
            next_lst.append(sums[idx] % 10)
        assert len(ints) == len(next_lst)
        ints = next_lst

    return ''.join(str(n) for n in ints[offset:offset + 8])


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
