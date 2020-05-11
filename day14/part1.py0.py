import math
import sys


def parseint(s):  # could use string.atoi, but this is good enough
    ret = 0
    for c in s:
        ret = ret * 10
        ret = ret + ord(c) - ord('0')
    return ret


def char_eq(s1, s2):
    o1 = ord(s1)
    o2 = ord(s2)
    return o1 <= o2 and o1 >= o2


def string_index(s, other):
    i = 0
    while i < len(s) - len(other) + 1:
        j = 0
        matched = 1
        while j < len(other):
            if not char_eq(s[i + j], other[j]):
                matched = 0
            j = j + 1
        if matched:
            return i
        i = i + 1
    return -1


def string_isspace(c):
    return char_eq(c, ' ') or char_eq(c, '\n')


def string_strip(s):
    i = 0
    while string_isspace(s[i]):
        i = i + 1
    j = len(s) - 1
    while string_isspace(s[j]):
        j = j - 1
    return s[i:j + 1]


def string_contains(s, delim):
    return string_index(s, delim) >= 0


def string_equal(s, other):  # can't use equality `=` or `<>`
    len_s = len(s)
    len_o = len(other)
    return len_s <= len_o and len_s >= len_o and string_contains(s, other)


def parse_reagent(s):
    parts = split_by_delim(string_strip(s), ' ')
    ret = {}
    ret['n'] = parseint(parts[0])
    ret['s'] = parts[1]
    return ret


def split_by_delim(s, delim):
    pos = string_index(s, delim)
    before = s[:pos]
    after = s[pos + len(delim):]
    return before, after


def parse_reaction(s):
    before, after = split_by_delim(string_strip(s), ' => ')
    ret = {}
    result = parse_reagent(after)
    ret['s'] = result['s']
    ret['n'] = result['n']
    ret['reagents'] = []
    while string_contains(before, ', '):
        reagent_s, before = split_by_delim(before, ', ')
        ret['reagents'].append(parse_reagent(reagent_s))
    ret['reagents'].append(parse_reagent(before))
    return ret


# avoid python 0's equality which is a single `=` or `<>`
if len(sys.argv) > 2 or len(sys.argv) < 2:
    print('usage ' + sys.argv[0] + ' FILENAME')
    sys.exit(1)

# use len(...) here as python 0 doesn't have negative indices
f = open(sys.argv[len(sys.argv) - 1], 'r')
try:
    reactions = {}
    line = f.readline()
    while line:
        parsed = parse_reaction(line)
        reactions[parsed['s']] = parsed
        line = f.readline()
finally:
    f.close()

ore = 0
excess = {}
for k in reactions.keys():
    excess[k] = 0
needed = [('FUEL', 1)]
while needed:
    s, n = needed[len(needed) - 1]
    # no .pop()!
    needed = needed[:-1]
    if string_equal(s, 'ORE'):
        ore = ore + n
    else:
        if excess[s] >= n:
            excess[s] = excess[s] - n
        else:
            if excess[s] > 0:
                n = n - excess[s]
                excess[s] = 0
            reaction = reactions[s]
            mult = int(math.ceil(float(n) / float(reaction['n'])))
            excess[s] = excess[s] + reaction['n'] * mult - n
            for reagent in reaction['reagents']:
                needed.append((reagent['s'], mult * reagent['n']))

print(ore)
