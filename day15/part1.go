package main

import "fmt"
import "io/ioutil"
import "math"
import "os"
import "strconv"
import "strings"

type Prog struct {
	Prog  map[int]int
	Pc    int
	Value int
}

type Point struct {
	X int
	Y int
}

func run(prog map[int]int, pc int, value int) Prog {
	rb := 0

	param := func(instr int, n int) int {
		mode := instr / int(math.Pow10(n+1)) % 10
		switch mode {
		case 0:
			return prog[prog[pc+n]]
		case 1:
			return prog[pc+n]
		case 2:
			return prog[rb+prog[pc+n]]
		default:
			panic(mode)
		}
	}
	store := func(instr int, n int) int {
		mode := instr / int(math.Pow10(n+1)) % 10
		switch mode {
		case 0:
			return prog[pc+n]
		case 2:
			return rb + prog[pc+n]
		default:
			panic(mode)
		}
	}

	for {
		instr := prog[pc]
		switch opc := instr % 100; opc {
		case 99:
			panic(opc)
		case 1:
			prog[store(instr, 3)] = param(instr, 1) + param(instr, 2)
			pc += 4
		case 2:
			prog[store(instr, 3)] = param(instr, 1) * param(instr, 2)
			pc += 4
		case 3:
			prog[store(instr, 1)] = value
			pc += 2
		case 4:
			return Prog{Prog: prog, Pc: pc + 2, Value: param(instr, 1)}
		case 5:
			if param(instr, 1) != 0 {
				pc = param(instr, 2)
			} else {
				pc += 3
			}
		case 6:
			if param(instr, 1) == 0 {
				pc = param(instr, 2)
			} else {
				pc += 3
			}
		case 7:
			if param(instr, 1) < param(instr, 2) {
				prog[store(instr, 3)] = 1
			} else {
				prog[store(instr, 3)] = 0
			}
			pc += 4
		case 8:
			if param(instr, 1) == param(instr, 2) {
				prog[store(instr, 3)] = 1
			} else {
				prog[store(instr, 3)] = 0
			}
			pc += 4
		case 9:
			rb += param(instr, 1)
			pc += 2
		default:
			panic(opc)
		}
	}
}

func addPosition(p Point, dir int) Point {
	x := p.X
	y := p.Y
	switch dir {
	case 1:
		y -= 1
	case 2:
		y += 1
	case 3:
		x -= 1
	case 4:
		x += 1
	default:
		panic(dir)
	}
	return Point{X: x, Y: y}
}

func copyMap(m map[int]int) map[int]int {
	ret := make(map[int]int)
	for k, v := range m {
		ret[k] = v
	}
	return ret
}

type Item struct {
	Prog  Prog
	Point Point
	Depth int
}

func main() {
	if len(os.Args) != 2 {
		fmt.Fprintf(os.Stderr, "usage: %v FILENAME\n", os.Args[0])
		os.Exit(1)
	}
	file, err := os.Open(os.Args[1])
	if err != nil {
		fmt.Fprintf(os.Stderr, "error opening file: %v\n", err)
		os.Exit(1)
	}
	contentsBytes, err := ioutil.ReadAll(file)
	if err != nil {
		fmt.Fprintf(os.Stderr, "error reading file: %v\n", err)
		os.Exit(1)
	}
	prog := make(map[int]int)
	contents := strings.TrimSpace(string(contentsBytes))
	for i, s := range strings.Split(contents, ",") {
		v, err := strconv.Atoi(s)
		if err != nil {
			fmt.Fprintf(os.Stderr, "error parsing value: %v", err)
			os.Exit(1)
		}
		prog[i] = v
	}

	programs := make([]Item, 0)
	for _, dir := range []int{1, 2, 3, 4} {
		programs = append(
			programs,
			Item{
				Prog:  run(copyMap(prog), 0, dir),
				Point: addPosition(Point{X: 0, Y: 0}, dir),
				Depth: 1,
			},
		)
	}

	area := make(map[Point]rune)
	for len(programs) > 0 {
		next := make([]Item, 0)
		for _, item := range programs {
			switch item.Prog.Value {
			case 0:
				area[item.Point] = '#'
			case 1:
				area[item.Point] = '.'
				for _, dir := range []int{1, 2, 3, 4} {
					newPoint := addPosition(item.Point, dir)
					if _, ok := area[newPoint]; ok {
						continue
					} else {
						next = append(
							next,
							Item{
								Prog: run(
									copyMap(item.Prog.Prog),
									item.Prog.Pc,
									dir,
								),
								Point: newPoint,
								Depth: item.Depth + 1,
							},
						)
					}
				}
			case 2:
				fmt.Println(item.Depth)
				os.Exit(0)
			}
		}
		programs = next
	}
}
