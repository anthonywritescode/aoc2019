import sys
from typing import List
from typing import Union

"""\
loop:
    if input[pos] == 0
        increment counter
    elif input[pos] == 1
        increment 1s counter
    else:  #  elif input[pos] == 2
        increment 2s counter

    increment i
    increment pos
    if i == 25 * 6:
        if min_zeros > counter:
            answer = 1s counter * 2s counter
            min_zeros = counter
        i = 0
        counter = 0
        1s counter = 0
        2s counter = 0

        if pos == 25 * 6 * 100:
            output answer
            halt

    goto loop
"""

"""\
jit $prog[pos] +7
add $counter_0 1 $counter_0
jit 1 +18
eq $prog[pos] 1 $comp_check
jif $comp_check +7
add $counter_1 1 $counter_1
jit 1 +4
add $counter_2 1 $counter_2

add $i 1 $i
add $1 1 $1
add $11 1 $11

eq $i 25 * 6 $comp_check
jif $comp_check 0
lt $counter $min_zero $comp_check
jif $comp_check +8
mult $counter_1 $counter_2 $answer
add $counter 0 $min_zeros

add 0 0 $i
add 0 0 $counter
add 0 0 $counter_1
add 0 0 $counter_2

eq $pos 25 * 6 * 100 $comp_check
jif $comp_check 0

output $answer
halt
"""


def main() -> int:
    prog: List[Union[int, str]] = [
        1005, '$pos', '+7',                     # $pos here is @1
        1001, '$counter_0', 1, '$counter_0',
        1105, 1, '+18',
        1008, '$pos', 1, '$comp_check',         # $pos here is @11
        1006, '$comp_check', '+7',
        1001, '$counter_1', 1, '$counter_1',
        1105, 1, '+4',
        1001, '$counter_2', 1, '$counter_2',

        1001, '$i', 1, '$i',
        1001, 1, 1, 1,                          # progress $pos above
        1001, 11, 1, 11,                        # progress $pos above

        1008, '$i', 25 * 6, '$comp_check',
        1006, '$comp_check', 0,
        7, '$counter_0', '$min_zero', '$comp_check',
        1006, '$comp_check', '+8',
        2, '$counter_1', '$counter_2', '$answer',
        1001, '$counter_0', 0, '$min_zero',

        1101, 0, 0, '$i',
        1101, 0, 0, '$counter_0',
        1101, 0, 0, '$counter_1',
        1101, 0, 0, '$counter_2',
        1001, '$n', 1, '$n',

        1008, '$n', 100, '$comp_check',
        1006, '$comp_check', 0,

        4, '$answer',
        99,
    ]

    def add_variable(s: str, val: int) -> None:
        variable_pos[s] = len(prog) + len(variables)
        variables.append(val)

    variables: List[int] = []
    variable_pos = {}
    add_variable('$comp_check', 0)
    add_variable('$i', 0)
    add_variable('$n', 0)
    add_variable('$min_zero', 25 * 6 + 1)
    add_variable('$answer', 0)
    add_variable('$counter_0', 0)
    add_variable('$counter_1', 0)
    add_variable('$counter_2', 0)

    variable_pos['$pos'] = len(prog) + len(variables)

    with open('input.txt') as f:
        data = [int(p) for p in list(f.read().strip())]

    for i, v in enumerate(prog):
        if isinstance(v, str) and v.startswith('+'):
            prog[i] = i + int(v) + 1

    final_prog = [
        p if isinstance(p, int) else variable_pos[p]
        for p in prog
    ] + variables + data

    for k, v in variable_pos.items():
        print(f'{k} => {v}', file=sys.stderr)

    # helpful for debugging
    print(str(final_prog[:100]), file=sys.stderr)
    print(','.join(str(p) for p in final_prog))
    return 0


if __name__ == '__main__':
    exit(main())
