[![Build Status](https://github.com/anthonywritescode/aoc2019/workflows/pre-commit/badge.svg)](https://github.com/anthonywritescode/aoc2019/actions)

advent of code 2019
===================

https://adventofcode.com/2019

### stream / youtube

- [Streamed daily on twitch](https://twitch.tv/anthonywritescode)
- [Uploaded to youtube afterwards](https://www.youtube.com/watch?v=YU3l-0dHTjs&list=PLWBKAf81pmOZuuQiuOT4Ag-yeTfZ9cN3_)

### about

for 2019 I'm trying to implement each day in a different language:

- day1: c++
- day2: c, javascript (part 1 also in sqlite)
- day3: bash
- day4: java (drunk), sqlite (sober)
- day5: rust, sqlite, javascript
- day6: perl
- day7: javascript
- day8: intcode (part1), lua (part2)
- day9: nim, sqlite
- day10: powershell
- day11: swift
- day12: kotlin
- day13: ruby
- day14: python0
- day15: go
- day16: crystal
- day17: php

### timing

- comparing to these numbers isn't necessarily useful
- normalize your timing to day 1 part 1 and compare
- alternate implementations are listed in parens
- these timings are very non-scientific (sample size 1)

```console
$ find -maxdepth 1 -type d -name 'day*' -not -name day0 | sort | xargs --replace bash -xc 'python {}/part1.py {}/input.txt; python {}/part2.py {}/input.txt'
+ python day01/part1.py day01/input.txt
3426455
> 84 μs (original)
3426455
> 67 μs (oneline)
+ python day01/part2.py day01/input.txt
5136807
> 636 μs (original)
5136807
> 677 μs (recursive)
+ python day02/part1.py day02/input.txt
6730673
> 99 μs
+ python day02/part2.py day02/input.txt
3749
> 90734 μs
+ python day03/part1.py day03/input.txt
225
> 276 ms (original)
225
> 266 ms (vector collision)
+ python day03/part2.py day03/input.txt
35194
> 352 ms
+ python day04/part1.py day04/input.txt
1929
> 646 ms
+ python day04/part2.py day04/input.txt
1306
> 634 ms
+ python day05/part1.py day05/input.txt
0
0
0
0
0
0
0
0
0
16574641
> 383 μs
$ python day05/part2.py day05/input.txt
15163975
> 439 μs
+ python day06/part1.py day06/input.txt
147223
> 32471 μs (original)
147223
> 1306 μs (memoized)
+ python day06/part2.py day06/input.txt
340
> 759 μs
+ python day07/part1.py day07/input.txt
199988
> 9347 μs
+ python day07/part2.py day07/input.txt
17519904
> 31611 μs
+ python day08/part1.py day08/input.txt
2520
> 143 μs
+ python day08/part2.py day08/input.txt
1    1111  11    11 1   1
1    1    1  1    1 1   1
1    111  1       1  1 1
1    1    1 11    1   1
1    1    1  1 1  1   1
1111 1111  111  11    1
> 1732 μs
+ python day09/part1.py day09/input.txt
2932210790
> 924 μs
+ python day09/part2.py day09/input.txt
73144
> 958 ms
+ python day10/part1.py day10/input.txt
267
> 325 ms
+ python day10/part2.py day10/input.txt
1309
> 5190 μs
+ python day11/part1.py day11/input.txt
2226
> 230 ms
python day11/part2.py day11/input.txt
 #  # ###   ##  #    #### #  # #    ####
 #  # #  # #  # #       # # #  #    #
 #### ###  #    #      #  ##   #    ###
 #  # #  # # ## #     #   # #  #    #
 #  # #  # #  # #    #    # #  #    #
 #  # ###   ### #### #### #  # #### #
> 21650 μs
+ python day12/part1.py day12/input.txt
5937
> 42334 μs
+ python day12/part2.py day12/input.txt
376203951569712
> 11835 ms
+ python day13/part1.py day13/input.txt
326
> 38577 μs
+ python day13/part2.py day13/input.txt
15988
> 2008 ms
+ python day14/part1.py day14/input.txt
178154
> 1995 μs
+ python day14/part2.py day14/input.txt
6226152
> 434 ms
+ python day15/part1.py day15/input.txt
294
> 142 ms
+ python day15/part2.py day15/input.txt
388
> 188 ms
+ python day16/part1.py day16/input.txt
85726502
> 13066 ms (original)
85726502
> 6211 ms (optimization 1)
85726502
> 4690 ms (optimization 2)
85726502
> 4591 ms (optimization 3)
85726502
+ python day16/part2.py day16/input.txt
92768399
> 19313 ms
+ python day17/part1.py day17/input.txt
3192
> 72921 μs
+ python day17/part2.py day17/input.txt
684691
> 171 ms
+ python day18/part1.py day18/input.txt
4544
> 6940 ms
+ python day18/part2.py day18/input.txt
1692
> 2064 ms
+ python day19/part1.py day19/input.txt
173
> 2264 ms
+ python day19/part2.py day19/input.txt
6671097
> 8900 ms
+ python day20/part1.py day20/input.txt
588
> 17989 μs
```
