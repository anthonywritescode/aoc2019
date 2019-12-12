import argparse
import re
from typing import NamedTuple

from support import timing

INT_RE = re.compile(r'-?\d+')


class Vector(NamedTuple):
    x: int
    y: int
    z: int

    def add(self, other: 'Vector') -> 'Vector':
        return self._replace(
            x=self.x + other.x,
            y=self.y + other.y,
            z=self.z + other.z,
        )


class Moon(NamedTuple):
    pos: Vector
    vel: Vector

    @classmethod
    def parse(cls, s: str) -> 'Moon':
        x_s, y_s, z_s = INT_RE.findall(s)
        return cls(
            pos=Vector(int(x_s), int(y_s), int(z_s)),
            vel=Vector(0, 0, 0),
        )


def compute(s: str) -> int:
    moons = [Moon.parse(line) for line in s.splitlines()]

    for _ in range(1000):
        for i, moon in enumerate(moons):
            v_x, v_y, v_z = moon.vel
            for o_moon in moons:
                if o_moon is moon:
                    continue
                if o_moon.pos.x > moon.pos.x:
                    v_x += 1
                elif o_moon.pos.x < moon.pos.x:
                    v_x -= 1
                if o_moon.pos.y > moon.pos.y:
                    v_y += 1
                elif o_moon.pos.y < moon.pos.y:
                    v_y -= 1
                if o_moon.pos.z > moon.pos.z:
                    v_z += 1
                elif o_moon.pos.z < moon.pos.z:
                    v_z -= 1
            moons[i] = moon._replace(vel=Vector(v_x, v_y, v_z))

        for i, moon in enumerate(moons):
            moons[i] = moon._replace(pos=moon.pos.add(moon.vel))

    return sum(
        sum(abs(p) for p in moon.pos) *
        sum(abs(p) for p in moon.vel)
        for moon in moons
    )


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument('data_file')
    args = parser.parse_args()

    with open(args.data_file) as f, timing():
        print(compute(f.read()))

    return 0


if __name__ == '__main__':
    exit(main())
