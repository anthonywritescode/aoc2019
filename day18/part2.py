import argparse
import collections
import sys
from typing import Dict
from typing import FrozenSet
from typing import Generator
from typing import List
from typing import Set
from typing import Tuple

import pytest

from support import timing


CoordT = Tuple[int, int]
GridT = Dict[CoordT, str]
KeysT = FrozenSet[str]
PathsT = Tuple[Tuple[str, ...], ...]


def next_pos(pos: CoordT) -> Generator[CoordT, None, None]:
    x, y = pos
    yield x + 1, y
    yield x - 1, y
    yield x, y + 1
    yield x, y - 1


def _trace_recursive(
        path: List[str],
        pos: CoordT,
        grid: GridT,
        visited: Set[CoordT],
        paths: List[Tuple[str, ...]],
) -> None:
    dead_end = True
    for cand in next_pos(pos):
        c = grid[cand]
        if cand in visited:
            continue
        elif c == '#':
            continue

        if c.isalpha():
            cand_path = path + [c]
        else:
            cand_path = path
        visited.add(cand)
        dead_end = False
        _trace_recursive(cand_path, cand, grid, visited, paths)

    if dead_end:
        paths.append(tuple(path))


def trace_keys(pos: CoordT, grid: GridT) -> PathsT:
    visited = {pos}
    paths: List[Tuple[str, ...]] = []
    _trace_recursive([], pos, grid, visited, paths)
    ret = set(paths)
    for path in tuple(paths):
        for i in range(len(path)):
            ret.discard(path[:i])
    return tuple(sorted(ret))


def _get_key(
        keys: KeysT,
        key: str,
        bot: CoordT,
        grid: GridT,
) -> Tuple[int, CoordT]:
    states = [(bot, 0)]
    visited = {bot}
    while states:
        states_next = []
        for pos, steps in states:
            for cand in next_pos(pos):
                c = grid[cand]
                if cand in visited:
                    continue
                elif c == '#':
                    continue
                elif c.isupper() and c.lower() not in keys:
                    continue

                if c.islower() and c == key:
                    return steps + 1, cand

                visited.add(cand)
                states_next.append((cand, steps + 1))
        states = states_next
    raise AssertionError('unreachable')


_cache: Dict[Tuple[KeysT, str, CoordT], Tuple[int, CoordT]] = {}


def get_key(
        keys: KeysT,
        key: str,
        bot: CoordT,
        grid: GridT,
) -> Tuple[int, CoordT]:
    try:
        return _cache[(keys, key, bot)]
    except KeyError:
        ret = _cache[(keys, key, bot)] = _get_key(keys, key, bot, grid)
        return ret


def possible_next_keys(
        keys: KeysT,
        paths: PathsT,
) -> Generator[str, None, None]:
    for path in paths:
        for c in path:
            if c.islower():
                yield c
                break
            elif c.isupper() and c.lower() not in keys:
                break


def redo_paths(
        keys: KeysT,
        all_paths: Tuple[PathsT, ...],
) -> Tuple[PathsT, ...]:
    return tuple(
        tuple(
            tup
            for tup in (
                tuple(c for c in path if c.lower() not in keys)
                for path in paths
            )
            if tup
        )
        for paths in all_paths
    )


def test_redo_paths() -> None:
    keys = frozenset(('a', 'b'))
    paths = ((('a', 'B', 'C', 'd'), (),),)
    assert redo_paths(keys, paths) == ((('C', 'd'),),)


def run_path(
        keys: KeysT,
        paths: Tuple[PathsT, ...],
        bots: Tuple[CoordT, ...],
        steps: int,
        grid: GridT,
        key_count: int,
        prune: Dict[Tuple[KeysT, Tuple[CoordT, ...]], int],
) -> int:
    if steps >= prune.get((keys, bots), sys.maxsize):
        return sys.maxsize
    prune[(keys, bots)] = steps
    if len(keys) == key_count:
        return steps

    minimum = sys.maxsize
    for i, bot in enumerate(bots):
        for key in possible_next_keys(keys, paths[i]):
            took_steps, new_bot = get_key(keys, key, bot, grid)
            new_keys = keys | {key}
            new_steps = steps + took_steps

            minimum = min(
                minimum,
                run_path(
                    new_keys,
                    redo_paths(new_keys, paths),
                    (*bots[:i], new_bot, *bots[i + 1:]),
                    new_steps,
                    grid,
                    key_count,
                    prune,
                ),
            )
    return minimum


def compute(s: str) -> int:
    grid: Dict[CoordT, str] = collections.defaultdict(str)
    key_count = 0
    for y, line in enumerate(s.splitlines()):
        for x, c in enumerate(line):
            grid[x, y] = c
            if c == '@':
                pos = (x, y)
            elif c.islower():
                key_count += 1

    pos_x, pos_y = pos
    bots = (
        (pos_x - 1, pos_y - 1),
        (pos_x + 1, pos_y - 1),
        (pos_x - 1, pos_y + 1),
        (pos_x + 1, pos_y + 1),
    )
    grid[pos] = '#'
    grid[pos_x + 1, pos_y] = '#'
    grid[pos_x - 1, pos_y] = '#'
    grid[pos_x, pos_y + 1] = '#'
    grid[pos_x, pos_y - 1] = '#'

    paths = tuple(trace_keys(bot, grid) for bot in bots)
    return run_path(frozenset(), paths, bots, 0, grid, key_count, {})


INPUT1 = '''\
###############
#d.ABC.#.....a#
######.#.######
#######@#######
######.#.######
#b.....#.....c#
###############
'''
INPUT2 = '''\
#############
#DcBa.#.GhKl#
#.###.#.#I###
#e#d##@##j#k#
###C#.#.###J#
#fEbA.#.FgHi#
#############
'''
INPUT3 = '''\
#############
#g#f.D#..h#l#
#F###e#E###.#
#dCba.#.BcIJ#
######@######
#nK.L.#.G...#
#M###N#H###.#
#o#m..#i#jk.#
#############
'''


@pytest.mark.parametrize(
    ('input_s', 'expected'),
    (
        (INPUT1, 24),
        (INPUT2, 32),
        (INPUT3, 72),
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
