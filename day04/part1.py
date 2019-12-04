import argparse

import pytest

from support import timing


"""\
It is a six-digit number.
The value is within the range given in your puzzle input.
Two adjacent digits are the same (like 22 in 122345).
Going from left to right, the digits never decrease; they only ever increase
or stay the same (like 111123 or 135679).
"""


def compute(s: str) -> int:
    beg_s, end_s = s.strip().split('-')
    beg, end = int(beg_s), int(end_s)
    n = 0
    for i in range(beg, end):
        str_i = str(i)
        if len(str_i) != 6:
            continue
        if not (
            ord(str_i[0]) <= ord(str_i[1]) <= ord(str_i[2]) <=
            ord(str_i[3]) <= ord(str_i[4]) <= ord(str_i[5])
        ):
            continue
        adjacent_same = False
        prev = str_i[0]
        for c in str_i[1:]:
            if c == prev:
                adjacent_same = True
            prev = c
        if not adjacent_same:
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
