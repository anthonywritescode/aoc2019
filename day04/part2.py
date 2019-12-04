import argparse
import collections

import pytest

from support import timing


def compute(s: str) -> int:
    beg_s, end_s = s.strip().split('-')
    beg, end = int(beg_s), int(end_s)
    n = 0
    for i in range(beg, end):
        str_i = str(i)

        if len(str_i) != 6:  # length must be 6
            continue

        if ''.join(sorted(str_i)) != str_i:  # non-decreasing order
            continue

        counts = collections.Counter(str_i)
        if 2 not in counts.values():  # some repeated digit, with exactly 2
            continue

        n += 1

    return n


@pytest.mark.parametrize(
    ('input_s', 'expected'),
    (
        # put given test cases here
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
