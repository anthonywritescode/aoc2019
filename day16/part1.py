import argparse
import itertools
from typing import Generator
from typing import Sequence

import pytest

from support import timing


def repeat(pattern: Sequence[int], n: int) -> Generator[int, None, None]:
    for val in pattern:
        for _ in range(n):
            yield val


def compute(s: str) -> str:
    ints = [int(c) for c in s.strip()]

    for _ in range(100):
        next_lst = []
        for idx in range(len(ints)):
            pattern = itertools.cycle(repeat((0, 1, 0, -1), idx + 1))
            next(pattern)
            val = sum(x * y for x, y in zip(ints, pattern))
            next_lst.append(abs(val) % 10)
        ints = next_lst

    return ''.join(str(n) for n in ints[:8])


def compute_jump1(s: str) -> str:
    ints = [int(c) for c in s.strip()]

    for _ in range(100):
        next_lst = []
        for idx in range((len(ints) + 1) // 2):
            pattern = itertools.cycle(repeat((0, 1, 0, -1), idx + 1))
            next(pattern)
            val = sum(x * y for x, y in zip(ints, pattern))
            next_lst.append(abs(val) % 10)
        for idx in range((len(ints) + 1) // 2, len(ints)):
            val = sum(ints[idx:]) % 10
            next_lst.append(val)
        assert len(ints) == len(next_lst)
        ints = next_lst

    return ''.join(str(n) for n in ints[:8])


def compute_jump2(s: str) -> str:
    ints = [int(c) for c in s.strip()]

    for _ in range(100):
        next_lst = []
        for idx in range((len(ints) + 1) // 2):
            pattern = itertools.cycle(repeat((1, 0, -1, 0), idx + 1))
            val = sum(x * y for x, y in zip(ints[idx:], pattern))
            next_lst.append(abs(val) % 10)
        for idx in range((len(ints) + 1) // 2, len(ints)):
            val = sum(ints[idx:]) % 10
            next_lst.append(val)
        assert len(ints) == len(next_lst)
        ints = next_lst

    return ''.join(str(n) for n in ints[:8])


def compute_jump3(s: str) -> str:
    ints = [int(c) for c in s.strip()]

    for _ in range(100):
        next_lst = []
        for idx in range((len(ints) + 1) // 2):
            pattern = itertools.cycle(repeat((1, 0, -1, 0), idx + 1))
            val = sum(x * y for x, y in zip(ints[idx:], pattern))
            next_lst.append(abs(val) % 10)

        restsum = sum(ints[len(ints) + 1:])
        for num in ints[len(ints) + 1:]:
            next_lst.append(abs(restsum) % 10)
            restsum -= num
        assert len(ints) == len(next_lst)
        ints = next_lst

    return ''.join(str(n) for n in ints[:8])


@pytest.mark.parametrize(
    ('input_s', 'expected'),
    (
        ('80871224585914546619083218645595', '24176176'),

        # put given test cases here
    ),
)
def test(input_s: str, expected: str) -> None:
    assert compute(input_s) == expected


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument('data_file')
    args = parser.parse_args()

    with open(args.data_file) as f, timing('original'):
        print(compute(f.read()))

    with open(args.data_file) as f, timing('optimization 1'):
        print(compute_jump1(f.read()))

    with open(args.data_file) as f, timing('optimization 2'):
        print(compute_jump2(f.read()))

    with open(args.data_file) as f, timing('optimization 3'):
        print(compute_jump2(f.read()))

    return 0


if __name__ == '__main__':
    exit(main())
