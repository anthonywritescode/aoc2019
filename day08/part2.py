import argparse

from support import timing


def compute(s: str) -> None:
    layer_size = 25 * 6
    s = s.strip()
    n_layers = len(s) // layer_size
    layers = [
        s[i * layer_size:layer_size + i * layer_size]
        for i in range(n_layers)
    ]

    for y in range(6):
        for x in range(25):
            for layer in layers:
                if layer[y * 25 + x] != '2':
                    print(layer[y * 25 + x].replace('0', ' '), end='')
                    break
            else:
                print('?', end='')
        print()


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument('data_file')
    args = parser.parse_args()

    with open(args.data_file) as f, timing():
        compute(f.read())

    return 0


if __name__ == '__main__':
    exit(main())
