[![Build Status](https://github.com/anthonywritescode/aoc2019/workflows/pre-commit/badge.svg)](https://github.com/anthonywritescode/aoc2019/actions)

advent of code 2019
===================

https://adventofcode.com/2019

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
> 232 ms
```
