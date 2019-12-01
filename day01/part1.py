import argparse

import pytest

from support import timing

"""\
to find the fuel required for a module, take its mass, divide by three,
round down, and subtract 2.

For example:

For a mass of 12, divide by 3 and round down to get 4, then subtract 2 to get 2
For a mass of 14, dividing by 3 and rounding down still yields 4, so the fuel
required is also 2.
For a mass of 1969, the fuel required is 654.
For a mass of 100756, the fuel required is 33583.
"""


def compute(s: str) -> int:
    total = 0
    for line in s.splitlines():
        line_val = int(line)
        total += line_val // 3 - 2
    return total


@pytest.mark.parametrize(
    ('input_s', 'expected'),
    (
        ('12', 2),
        ('14', 2),
        ('1969', 654),
        ('100756', 33583),
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
