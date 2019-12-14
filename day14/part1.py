import argparse
import collections
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


def compute(s: str) -> int:
    all_reactions = [Reaction.parse(line) for line in s.splitlines()]
    reactions = {reaction.chemical: reaction for reaction in all_reactions}

    ore = 0
    excess: Dict[str, int] = collections.defaultdict(int)
    needed = [Reagent('FUEL', 1)]

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


SAMPLE1 = """\
10 ORE => 10 A
1 ORE => 1 B
7 A, 1 B => 1 C
7 A, 1 C => 1 D
7 A, 1 D => 1 E
7 A, 1 E => 1 FUEL
"""


@pytest.mark.parametrize(
    ('input_s', 'expected'),
    (
        (SAMPLE1, 31),
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
