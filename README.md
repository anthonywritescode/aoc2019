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
+ python ./day1/part1.py ./day1/input.txt
TODO OUTPUT
> TODO TIMING
```
