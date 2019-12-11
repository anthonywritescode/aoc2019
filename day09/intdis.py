import argparse
from typing import NamedTuple


class Op(NamedTuple):
    fmt: str
    param_count: int


OPS = {
    99: Op('(hal)', 0),
    1: Op('(add) {s3:4} = ({p1:4}  + {p2})', 3),
    2: Op('(mul) {s3:4} = ({p1:4}  * {p2})', 3),
    3: Op('(inp) {s1:4} = input()', 1),
    4: Op('(out) output({p1})', 1),
    5: Op('(jit) if {p1}: goto {p2}', 2),
    6: Op('(jif) if not {p1}: goto {p2}', 2),
    7: Op('(lt_) {s3:4} = ({p1:4}  < {p2})', 3),
    8: Op('(eq_) {s3:4} = ({p1:4} == {p2})', 3),
    9: Op('(rel) rb += {p1:4}', 1),
}
D = Op('(___) {d1} {d2} {d3} {d4} {d5} {d6} {d7} {d8} {d9} {d10}', 10)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument('filename')
    args = parser.parse_args()

    with open(args.filename) as f:
        prog = dict(enumerate(int(p) for p in f.read().strip().split(',')))

    def param(instr: int, n: int) -> str:
        if i + n not in prog:
            return '_'

        mode = instr // (10 ** (n + 1)) % 10
        if mode == 0:
            return f'${prog[i + n]}'
        elif mode == 1:
            return str(prog[i + n])
        elif mode == 2:
            return f'r${prog[i + n]}'
        else:
            return '_'

    def store(instr: int, n: int) -> str:
        if i + n not in prog:
            return '_'

        mode = instr // (10 ** (n + 1)) % 10
        if mode == 0:
            return f'${prog[i + n]}'
        elif mode == 2:
            return f'r${prog[i + n]}'
        else:
            return '_'

    def d(n: int) -> str:
        if i + n in prog:
            return str(prog[i + n])
        else:
            return '_'

    data = False
    i = 0
    while i < len(prog):
        instr = prog[i]
        opc = instr % 100
        if data or opc not in OPS:
            data = True
            op = D
        else:
            op = OPS[opc]

        params = {
            'p1': param(instr, 1),
            'p2': param(instr, 2),
            's1': store(instr, 1),
            's3': store(instr, 3),
            **{f'd{j}': d(j) for j in range(1, 11)},
        }
        print(f'{i:{len(str(len(prog))) + 1}}| {op.fmt.format(**params)}')
        i += 1 + op.param_count

    return 0


if __name__ == '__main__':
    exit(main())
