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
```
