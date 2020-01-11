import argparse
from typing import Dict
from typing import Generator
from typing import Tuple

import pytest

from support import timing


def compute(s: str) -> int:
    grid = s.splitlines()

    warps: Dict[Tuple[int, int], Tuple[int, int]] = {}
    warp_temp: Dict[str, Tuple[int, int]] = {}
    for y, line in enumerate(grid):
        if y == 0 or y == len(grid) - 1:
            continue
        for x, c in enumerate(line):
            if x == 0 or x == len(line) - 1:
                continue
            if c.isalpha():
                if grid[y][x + 1].isalpha():
                    s = c + grid[y][x + 1]
                    if x + 2 < len(line) and grid[y][x + 2] == '.':
                        pos = (y, x + 2)
                    else:
                        pos = (y, x - 1)
                elif grid[y][x - 1].isalpha():
                    s = grid[y][x - 1] + c
                    if x - 2 >= 0 and grid[y][x - 2] == '.':
                        pos = (y, x - 2)
                    else:
                        pos = (y, x + 1)
                elif grid[y + 1][x].isalpha():
                    s = c + grid[y + 1][x]
                    if y + 2 < len(grid) and grid[y + 2][x] == '.':
                        pos = (y + 2, x)
                    else:
                        pos = (y - 1, x)
                elif grid[y - 1][x].isalpha():
                    s = grid[y - 1][x] + c
                    if y - 2 >= 0 and grid[y - 2][x] == '.':
                        pos = (y - 2, x)
                    else:
                        pos = (y + 1, x)
                else:
                    raise AssertionError('unreachable')
                if s in warp_temp and warp_temp[s] != pos:
                    warps[warp_temp[s]] = pos
                    warps[pos] = warp_temp[s]
                else:
                    warp_temp[s] = pos

    def points(
            pt: Tuple[int, int],
            level: int,
    ) -> Generator[Tuple[Tuple[int, int], int], None, None]:
        if pt in warps:
            outer_warp = (
                pt[0] == 2 or pt[0] == len(grid) - 3 or
                pt[1] == 2 or pt[1] == len(grid[0]) - 3
            )
            if level == 0:
                if not outer_warp:
                    yield warps[pt], level + 1
            elif outer_warp:
                yield warps[pt], level - 1
            else:
                yield warps[pt], level + 1
        y, x = pt
        if grid[y + 1][x] == '.':
            yield (y + 1, x), level
        if grid[y - 1][x] == '.':
            yield (y - 1, x), level
        if grid[y][x + 1] == '.':
            yield (y, x + 1), level
        if grid[y][x - 1] == '.':
            yield (y, x - 1), level

    seen = {(warp_temp['AA'], 0)}
    paths = [(warp_temp['AA'], 0, 0)]
    while paths:
        next_paths = []

        for pt, level, n in paths:
            for next_pt, next_level in points(pt, level):
                if (next_pt, next_level) == (warp_temp['ZZ'], 0):
                    return n + 1
                elif (next_pt, next_level) in seen:
                    continue
                else:
                    seen.add((next_pt, next_level))
                    next_paths.append((next_pt, next_level, n + 1))

        paths = next_paths

    raise AssertionError('unreachable')


SAMPLE1 = '''\
         A          .
         A          .
  #######.######### .
  #######.........# .
  #######.#######.# .
  #######.#######.# .
  #######.#######.# .
  #####  B    ###.# .
BC...##  C    ###.# .
  ##.##       ###.# .
  ##...DE  F  ###.# .
  #####    G  ###.# .
  #########.#####.# .
DE..#######...###.# .
  #.#########.###.# .
FG..#########.....# .
  ###########.##### .
             Z      .
             Z      .
'''
SAMPLE2 = '''\
             Z L X W       C                .
             Z P Q B       K                .
  ###########.#.#.#.#######.############### .
  #...#.......#.#.......#.#.......#.#.#...# .
  ###.#.#.#.#.#.#.#.###.#.#.#######.#.#.### .
  #.#...#.#.#...#.#.#...#...#...#.#.......# .
  #.###.#######.###.###.#.###.###.#.####### .
  #...#.......#.#...#...#.............#...# .
  #.#########.#######.#.#######.#######.### .
  #...#.#    F       R I       Z    #.#.#.# .
  #.###.#    D       E C       H    #.#.#.# .
  #.#...#                           #...#.# .
  #.###.#                           #.###.# .
  #.#....OA                       WB..#.#..ZH
  #.###.#                           #.#.#.# .
CJ......#                           #.....# .
  #######                           ####### .
  #.#....CK                         #......IC
  #.###.#                           #.###.# .
  #.....#                           #...#.# .
  ###.###                           #.#.#.# .
XF....#.#                         RF..#.#.# .
  #####.#                           ####### .
  #......CJ                       NM..#...# .
  ###.#.#                           #.###.# .
RE....#.#                           #......RF
  ###.###        X   X       L      #.#.#.# .
  #.....#        F   Q       P      #.#.#.# .
  ###.###########.###.#######.#########.### .
  #.....#...#.....#.......#...#.....#.#...# .
  #####.#.###.#######.#######.###.###.#.#.# .
  #.......#.......#.#.#.#.#...#...#...#.#.# .
  #####.###.#####.#.#.#.#.###.###.#.###.### .
  #.......#.....#.#...#...............#...# .
  #############.#.#.###.################### .
               A O F   N                    .
               A A D   M                    .
'''


@pytest.mark.parametrize(
    ('input_s', 'expected'),
    (
        (SAMPLE1, 26),
        (SAMPLE2, 396),
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
