import argparse

from support import timing


def do_deck(s: str, idx: int, decksize: int) -> int:
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


def compute(s: str) -> int:
    idx = 2020
    decksize = 119315717514047
    count = 101741582076661
    """\
    i = 1
    idx = do_deck(s, idx, decksize)
    while idx != 2020:
        if i % 100 == 0:
            print('.', end='', flush=True)
        i += 1
        idx = do_deck(s, idx, decksize)
    breakpoint()
    """
    for i in range(1000):
        prev, idx = idx, do_deck(s, idx, decksize)
        print(f'{idx}\t\tdiff: {prev - idx}')

    return idx


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument('data_file')
    args = parser.parse_args()

    with open(args.data_file) as f, timing():
        print(compute(f.read()))

    return 0


if __name__ == '__main__':
    exit(main())
