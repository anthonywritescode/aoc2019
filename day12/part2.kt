import java.io.File
import kotlin.collections.MutableList
import kotlin.math.abs
import kotlin.system.exitProcess
import kotlin.text.Regex

data class Vector(val x: Long, val y: Long, val z: Long) {
    fun add(other: Vector): Vector {
        return Vector(this.x + other.x, this.y + other.y, this.z + other.z)
    }

    fun value(): Long {
        return abs(this.x) + abs(this.y) + abs(this.z)
    }

    override fun toString(): String {
        return "Vector(x=${this.x}, y=${this.y}, z=${this.z})"
    }
}

data class Moon(val pos: Vector, val vel: Vector) {
    override fun toString(): String {
        return "Moon(pos=${this.pos}, vel=${this.vel})"
    }

    fun value(): Long {
        return this.pos.value() * this.vel.value()
    }

    fun xs(): Pair<Long, Long> {
        return Pair(this.pos.x, this.vel.x)
    }

    fun ys(): Pair<Long, Long> {
        return Pair(this.pos.y, this.vel.y)
    }

    fun zs(): Pair<Long, Long> {
        return Pair(this.pos.z, this.vel.z)
    }

    companion object {
        val reg = Regex("<x=(-?[0-9]+), y=(-?[0-9]+), z=(-?[0-9]+)>")
        fun parse(s: String): Moon {
            val parsed = reg.matchEntire(s)!!
            return Moon(
                Vector(
                    parsed.groupValues[1].toLong(),
                    parsed.groupValues[2].toLong(),
                    parsed.groupValues[3].toLong()
                ),
                Vector(0, 0, 0)
            )
        }
    }
}

fun gcd(a: Long, b: Long): Long = if (b == 0L) a else gcd(b, a % b)

fun lcm(x: Long, y: Long): Long = x * y / gcd(x, y)

fun main(args: Array<String>) {
    if (args.count() != 1) {
        println("error: supply a filename!")
        exitProcess(1)
    }

    var moons: MutableList<Moon> = ArrayList()
    File(args[0]).forEachLine { moons.add(Moon.parse(it)) }

    val origXs = moons.map { it.xs() }
    var xPeriod: Long? = null
    val origYs = moons.map { it.ys() }
    var yPeriod: Long? = null
    val origZs = moons.map { it.zs() }
    var zPeriod: Long? = null

    var q: Long = 0
    while (xPeriod == null || yPeriod == null || zPeriod == null) {
        q += 1
        for ((i, moon) in moons.withIndex()) {
            var (v_x, v_y, v_z) = moon.vel
            for (o_moon in moons) {
                if (o_moon == moon) {
                    continue
                }
                if (o_moon.pos.x > moon.pos.x) {
                    v_x += 1
                } else if (o_moon.pos.x < moon.pos.x) {
                    v_x -= 1
                }
                if (o_moon.pos.y > moon.pos.y) {
                    v_y += 1
                } else if (o_moon.pos.y < moon.pos.y) {
                    v_y -= 1
                }
                if (o_moon.pos.z > moon.pos.z) {
                    v_z += 1
                } else if (o_moon.pos.z < moon.pos.z) {
                    v_z -= 1
                }
            }
            moons[i] = Moon(moon.pos, Vector(v_x, v_y, v_z))
        }

        for ((i, moon) in moons.withIndex()) {
            moons[i] = Moon(moon.pos.add(moon.vel), moon.vel)
        }

        if (xPeriod == null && moons.map { it.xs() } == origXs) {
            xPeriod = q
        }
        if (yPeriod == null && moons.map { it.ys() } == origYs) {
            yPeriod = q
        }
        if (zPeriod == null && moons.map { it.zs() } == origZs) {
            zPeriod = q
        }
    }

    println(xPeriod)
    println(yPeriod)
    println(zPeriod)
    println(lcm(lcm(xPeriod, yPeriod), zPeriod))
}
