#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 1 ]; then
    echo "usage: $0 FILENAME" 1>&2
    exit 1
elif [ ! -f "$1" ]; then
    echo "file does not exist: $1" 1>&2
    exit 1
fi

lines=()
while IFS= read -r line; do
    lines+=("$line,")
done < "$1"

declare -A grid
x=0
y=0
n=0
while IFS= read -d, -r part; do
    direction="${part:0:1}"
    magnitude="${part:1}"
    for ((i=0;i<magnitude;i++)); do
        if [ "$direction" = "R" ]; then
            : $((x+=1))
        elif [ "$direction" = "L" ]; then
            : $((x-=1))
        elif [ "$direction" = "U" ]; then
            : $((y+=1))
        elif [ "$direction" = "D" ]; then
            : $((y-=1))
        fi
        : $((n+=1))
        if [ ! "${grid[$x,$y]+isset}" ]; then
            grid["$x,$y"]="$n"
        fi
    done
done <<< "${lines[0]}"

steps=()
x=0
y=0
n=0
while IFS= read -d, -r part; do
    direction="${part:0:1}"
    magnitude="${part:1}"
    for ((i=0;i<magnitude;i++)); do
        if [ "$direction" = "R" ]; then
            : $((x+=1))
        elif [ "$direction" = "L" ]; then
            : $((x-=1))
        elif [ "$direction" = "U" ]; then
            : $((y+=1))
        elif [ "$direction" = "D" ]; then
            : $((y-=1))
        fi
        : $((n+=1))
        if [ "${grid[$x,$y]+isset}" ]; then
            steps+=($(("${grid[$x,$y]}"+"$n")))
        fi
    done
done <<< "${lines[1]}"

min=1000000
for candidate in "${steps[@]}"; do
    if [ "$candidate" -lt "$min" ]; then
        min="$candidate"
    fi
done

echo "$min"
