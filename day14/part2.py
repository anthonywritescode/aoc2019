import argparse
import math
from typing import Dict
from typing import NamedTuple
from typing import Tuple

import pytest

from support import timing


class Reagent(NamedTuple):
    chemical: str
    quantity: int

    @classmethod
    def parse(cls, s: str) -> 'Reagent':
        n, s = s.strip().split()
        return cls(s, int(n))


class Reaction(NamedTuple):
    chemical: str
    quantity: int
    reagents: Tuple[Reagent, ...]

    @classmethod
    def parse(cls, s: str) -> 'Reaction':
        reagents_s, _, result_s = s.partition(' => ')
        reagents = tuple(Reagent.parse(s) for s in reagents_s.split(', '))
        result = Reagent.parse(result_s)
        return cls(result.chemical, result.quantity, reagents)


def parse_chemical(s: str) -> Reagent:
    n, s = s.strip().split()
    return Reagent(s, int(n))


def require(
        s: str,
        n: int,
        reactions: Dict[str, Reaction],
        excess: Dict[str, int],
) -> int:
    ore = 0
    needed = [Reagent(s, n)]
    while needed:
        s, n = needed.pop()
        if s == 'ORE':
            ore += n
        else:
            if excess[s] >= n:
                excess[s] -= n
                continue
            elif excess[s]:
                n -= excess[s]
                excess[s] = 0

            reaction = reactions[s]
            mult = math.ceil(n / reaction.quantity)
            excess[s] += reaction.quantity * mult - n
            for reagent in reaction.reagents:
                new = reagent._replace(quantity=mult * reagent.quantity)
                needed.append(new)
    return ore


def compute(s: str) -> int:
    all_reactions = [Reaction.parse(line) for line in s.splitlines()]
    reactions = {reaction.chemical: reaction for reaction in all_reactions}

    ore = 1000000000000
    fuel = 1
    inc = 1

    while True:
        excess = {k: 0 for k in reactions}
        ore_required = require('FUEL', fuel + inc, reactions, excess)
        if ore_required > ore:
            if inc == 1:
                break
            else:
                inc = 1
        else:
            fuel += inc
            inc *= 2

    return fuel


SAMPLE1 = """\
157 ORE => 5 N
165 ORE => 6 D
44 X, 5 K, 1 Q, 29 N, 9 G, 48 H => 1 FUEL
12 H, 1 G, 8 P => 9 Q
179 ORE => 7 P
177 ORE => 5 H
7 D, 7 P => 2 X
165 ORE => 2 G
3 D, 7 N, 5 H, 10 P => 8 K
"""

SAMPLE2 = """\
2 VPVL, 7 FWMGM, 2 CXFTF, 11 MNCFX => 1 STKFG
17 NVRVD, 3 JNWZP => 8 VPVL
53 STKFG, 6 MNCFX, 46 VJHF, 81 HVMC, 68 CXFTF, 25 GNMV => 1 FUEL
22 VJHF, 37 MNCFX => 5 FWMGM
139 ORE => 4 NVRVD
144 ORE => 7 JNWZP
5 MNCFX, 7 RFSQX, 2 FWMGM, 2 VPVL, 19 CXFTF => 3 HVMC
5 VJHF, 7 MNCFX, 9 VPVL, 37 CXFTF => 6 GNMV
145 ORE => 6 MNCFX
1 NVRVD => 8 CXFTF
1 VJHF, 6 MNCFX => 4 RFSQX
176 ORE => 6 VJHF
"""

SAMPLE3 = """\
171 ORE => 8 CNZTR
7 ZLQW, 3 BMBT, 9 XCVML, 26 XMNCP, 1 WPTQ, 2 MZWV, 1 RJRHP => 4 PLWSL
114 ORE => 4 BHXH
14 VRPVC => 6 BMBT
6 BHXH, 18 KTJDG, 12 WPTQ, 7 PLWSL, 31 FHTLT, 37 ZDVW => 1 FUEL
6 WPTQ, 2 BMBT, 8 ZLQW, 18 KTJDG, 1 XMNCP, 6 MZWV, 1 RJRHP => 6 FHTLT
15 XDBXC, 2 LTCX, 1 VRPVC => 6 ZLQW
13 WPTQ, 10 LTCX, 3 RJRHP, 14 XMNCP, 2 MZWV, 1 ZLQW => 1 ZDVW
5 BMBT => 4 WPTQ
189 ORE => 9 KTJDG
1 MZWV, 17 XDBXC, 3 XCVML => 2 XMNCP
12 VRPVC, 27 CNZTR => 2 XDBXC
15 KTJDG, 12 BHXH => 5 XCVML
3 BHXH, 2 VRPVC => 7 MZWV
121 ORE => 7 VRPVC
7 XCVML => 6 RJRHP
5 BHXH, 4 VRPVC => 5 LTCX
"""


@pytest.mark.parametrize(
    ('input_s', 'expected'),
    (
        pytest.param(SAMPLE1, 82892753, id='sample1'),
        pytest.param(SAMPLE2, 5586022, id='sample2'),
        pytest.param(SAMPLE3, 460664, id='sample3'),
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
