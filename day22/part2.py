import argparse
from typing import NamedTuple

from support import timing


class Op(NamedTuple):
    s: str
    n: int


def compute(s: str) -> int:
    deck_size = 119315717514047

    instructions = []

    def _add_instruction(op: str, n: int) -> None:
        instructions.append(Op(op, n))

    for line in s.splitlines():
        if line == 'deal into new stack':
            _add_instruction('deal with increment', -1)
            # XXX: I don't know why this is negative? (copied)
            _add_instruction('cut', -1)
        else:
            s, _, n_s = line.rpartition(' ')
            if s == 'cut':
                # XXX: I don't know why this is negative? (copied)
                _add_instruction(s, -int(n_s))
            else:
                _add_instruction(s, int(n_s))

    cut_n = 0
    deal_n = 1
    for op in instructions:
        if op.s == 'cut':
            cut_n += op.n
        elif op.s == 'deal with increment':
            cut_n = (cut_n * op.n) % deck_size
            deal_n = (deal_n * op.n) % deck_size

    times = 101741582076661

    # cut_n = cut_n * (1 - deal_n ** times) // (1 - deal_n) % deck_size
    # [(a mod n)(b−1 mod n)] mod n

    cut_n = (
        (cut_n * pow(deal_n, times, deck_size) - cut_n % deck_size) *
        pow(deal_n - 1, -1, deck_size) % deck_size
    )
    deal_n = pow(deal_n, times, deck_size)

    # (x * deal_n + cut_n) % deck_size ~= 2020
    # =>

    return (2020 + deck_size - cut_n) * pow(deal_n, -1, deck_size) % deck_size


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument('data_file')
    args = parser.parse_args()

    with open(args.data_file) as f, timing('original'):
        print(compute(f.read()))

    return 0


if __name__ == '__main__':
    exit(main())
