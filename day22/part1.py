import argparse
from typing import List

import pytest

from support import timing


def do_deck(s: str, decksize: int) -> List[int]:
    deck = list(range(decksize))
    for line in s.splitlines():
        if line == 'deal into new stack':
            deck.reverse()
        else:
            op_s, _, n_s = line.rpartition(' ')
            n = int(n_s)
            if op_s == 'cut':
                deck = deck[n:] + deck[:n]
            else:
                new_deck = [0] * decksize
                idx = 0
                for i in range(decksize):
                    new_deck[idx] = deck[i]
                    idx = (idx + n) % decksize
                deck = new_deck
    return deck


def compute(s: str) -> int:
    deck = do_deck(s, 10007)
    return deck.index(2019)


def do_deck_fast(s: str, idx: int, decksize: int) -> int:
    for line in s.splitlines():
        if line == 'deal into new stack':
            idx = decksize - idx - 1
        else:
            op_s, _, n_s = line.rpartition(' ')
            n = int(n_s)
            if op_s == 'cut':
                idx = (idx - n) % decksize
            else:
                idx = (idx * n) % decksize
    return idx


def compute_fast(s: str) -> int:
    return do_deck_fast(s, 2019, 10007)


@pytest.mark.parametrize(
    ('input_s', 'expected'),
    (
        ('deal into new stack', [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]),
        ('cut 3', [3, 4, 5, 6, 7, 8, 9, 0, 1, 2]),
        ('cut -3', [7, 8, 9, 0, 1, 2, 3, 4, 5, 6]),
        ('deal with increment 3', [0, 7, 4, 1, 8, 5, 2, 9, 6, 3]),
    ),
)
def test(input_s: str, expected: int) -> None:
    assert do_deck(input_s, 10) == expected


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument('data_file')
    args = parser.parse_args()

    with open(args.data_file) as f, timing('original'):
        print(compute(f.read()))

    with open(args.data_file) as f, timing('faster'):
        print(compute_fast(f.read()))

    return 0


if __name__ == '__main__':
    exit(main())
