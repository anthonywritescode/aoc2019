import java.io.File
import kotlin.collections.MutableList
import kotlin.math.abs
import kotlin.system.exitProcess
import kotlin.text.Regex

data class Vector(val x: Int, val y: Int, val z: Int) {
    fun add(other: Vector): Vector {
        return Vector(this.x + other.x, this.y + other.y, this.z + other.z)
    }

    fun value(): Int {
        return abs(this.x) + abs(this.y) + abs(this.z)
    }

    override fun toString(): String {
        return "Vector(x=${this.x}, y=${this.y}, z=${this.z})"
    }
}

class Moon(val pos: Vector, val vel: Vector) {
    override fun toString(): String {
        return "Moon(pos=${this.pos}, vel=${this.vel})"
    }

    fun value(): Int {
        return this.pos.value() * this.vel.value()
    }

    companion object {
        val reg = Regex("<x=(-?[0-9]+), y=(-?[0-9]+), z=(-?[0-9]+)>")
        fun parse(s: String): Moon {
            val parsed = reg.matchEntire(s)!!
            return Moon(
                Vector(
                    parsed.groupValues[1].toInt(),
                    parsed.groupValues[2].toInt(),
                    parsed.groupValues[3].toInt()
                ),
                Vector(0, 0, 0)
            )
        }
    }
}

fun main(args: Array<String>) {
    if (args.count() != 1) {
        println("error: supply a filename!")
        exitProcess(1)
    }

    var moons: MutableList<Moon> = ArrayList()
    File(args[0]).forEachLine { moons.add(Moon.parse(it)) }

    for (q in 0 until 1000) {
        for ((i, moon) in moons.withIndex()) {
            var (vX, vY, vZ) = moon.vel
            for (o_moon in moons) {
                if (o_moon == moon) {
                    continue
                }
                if (o_moon.pos.x > moon.pos.x) {
                    vX += 1
                } else if (o_moon.pos.x < moon.pos.x) {
                    vX -= 1
                }
                if (o_moon.pos.y > moon.pos.y) {
                    vY += 1
                } else if (o_moon.pos.y < moon.pos.y) {
                    vY -= 1
                }
                if (o_moon.pos.z > moon.pos.z) {
                    vZ += 1
                } else if (o_moon.pos.z < moon.pos.z) {
                    vZ -= 1
                }
            }
            moons[i] = Moon(moon.pos, Vector(vX, vY, vZ))
        }

        for ((i, moon) in moons.withIndex()) {
            moons[i] = Moon(moon.pos.add(moon.vel), moon.vel)
        }
    }

    println(moons.map { it.value() }.sum())
}
