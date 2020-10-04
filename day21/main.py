import argparse
import collections
from typing import Callable
from typing import Dict

"""\
# some manual work I did to figure this out?
~ (B & ~C & H)

~ (~D | (A & (B | (E & I)) & (~B | C | ~H)  ))

OR E J
AND I J
OR B J
AND A J

NOT C T
AND B T
AND H T
NOT T T
AND T J

NOT D T
OR T J

NOT J J
RUN

D && (
    ~A |
    ((implied A) & ~B & (~E | ~I)) |
    # ???
    ((implied A) & B & ~C & H)
)
"""


def run(
        prog: Dict[int, int],
        in_fn: Callable[[], int],
        out_fn: Callable[[int], None],
) -> None:
    def parameter(instr: int, n: int) -> int:
        mode = instr // (10 ** (n + 1)) % 10
        if mode == 0:
            return prog[prog[pc + n]]
        elif mode == 1:
            return prog[pc + n]
        elif mode == 2:
            return prog[rb + prog[pc + n]]
        else:
            raise NotImplementedError(mode)

    def store(instr: int, n: int) -> int:
        mode = instr // (10 ** (n + 1)) % 10
        if mode == 0:
            return prog[pc + n]
        elif mode == 2:
            return rb + prog[pc + n]
        else:
            raise NotImplementedError(mode)

    rb = 0
    pc = 0
    while pc < len(prog):
        instr = prog[pc]
        opc = instr % 100
        if opc == 99:
            return
        elif opc == 1:
            prog[store(instr, 3)] = parameter(instr, 1) + parameter(instr, 2)
            pc += 4
        elif opc == 2:
            prog[store(instr, 3)] = parameter(instr, 1) * parameter(instr, 2)
            pc += 4
        elif opc == 3:
            prog[store(instr, 1)] = in_fn()
            pc += 2
        elif opc == 4:
            out_fn(parameter(instr, 1))
            pc += 2
        elif opc == 5:
            if parameter(instr, 1):
                pc = parameter(instr, 2)
            else:
                pc += 3
        elif opc == 6:
            if not parameter(instr, 1):
                pc = parameter(instr, 2)
            else:
                pc += 3
        elif opc == 7:
            if parameter(instr, 1) < parameter(instr, 2):
                prog[store(instr, 3)] = 1
            else:
                prog[store(instr, 3)] = 0
            pc += 4
        elif opc == 8:
            if parameter(instr, 1) == parameter(instr, 2):
                prog[store(instr, 3)] = 1
            else:
                prog[store(instr, 3)] = 0
            pc += 4
        elif opc == 9:
            rb += parameter(instr, 1)
            pc += 2
        else:
            raise AssertionError(f'unreachable? {prog} {pc}')
    raise AssertionError(f'unreachable? {prog} {pc}')


def compute(s: str) -> None:
    prog = [int(part) for part in s.strip().split(',')]
    prog_d = collections.defaultdict(int, enumerate(prog))

    script = '''\
OR E J
AND I J
OR B J
AND A J
NOT C T
AND B T
AND H T
NOT T T
AND T J
NOT D T
OR T J
NOT J J
RUN
'''
    script_iter = iter(script)

    def in_fn() -> int:
        return ord(next(script_iter))

    def out_fn(n: int) -> None:
        if n < 256:
            print(chr(n), end='')
        else:
            print(n)

    print(','.join(str(n) for n in prog))

    run(prog_d, in_fn, out_fn)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument('data_file')
    args = parser.parse_args()

    contents = ''
    with open(args.data_file) as f:
        for line in f:
            line, _, _ = line.partition(';')
            line = line.strip()
            if line and not line.endswith(','):
                line = f'{line.strip()},'
            contents += line
    contents = contents.rstrip(',\n')

    compute(contents)

    return 0


if __name__ == '__main__':
    exit(main())
