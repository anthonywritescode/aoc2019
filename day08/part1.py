import argparse

import pytest

from support import timing


def compute(s: str) -> int:
    layer_size = 25 * 6
    s = s.strip()
    n_layers = len(s) // layer_size
    layers = [
        s[i * layer_size:layer_size + i * layer_size]
        for i in range(n_layers)
    ]
    min_layer = min(layers, key=lambda s: s.count('0'))
    return min_layer.count('1') * min_layer.count('2')


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
