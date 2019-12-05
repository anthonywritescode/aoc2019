use std::env;
use std::fs;
use std::process;

fn parameter(instr: i64, n: u32, prog: &Vec<i64>, pc: usize) -> i64 {
    let mode = instr / (10_i64.pow(n + 1)) % 10;
    match mode {
        0 => return prog[prog[pc + n as usize] as usize],
        1 => return prog[pc + n as usize],
        _ => panic!("unknown mode {}", mode),
    }
}

fn main() {
    let args: Vec<String> = env::args().collect();
    if args.len() != 2 {
        println!("usage {} INPUT", args[0]);
        process::exit(1);
    }

    let mut prog = fs::read_to_string(&args[1])
        .expect("file error")
        .trim()
        .split(',')
        .map(|s| s.parse::<i64>().expect("cound not parse int"))
        .collect::<Vec<i64>>();

    let mut pc = 0;
    while pc < prog.len() {
        let instr = prog[pc];
        let opc = instr % 100;
        match opc {
            99 => return,
            1 => {
                let idx = prog[pc + 3] as usize;
                prog[idx] =
                    parameter(instr, 1, &prog, pc) +
                    parameter(instr, 2, &prog, pc);
                pc += 4;
            },
            2 => {
                let idx = prog[pc + 3] as usize;
                prog[idx] =
                    parameter(instr, 1, &prog, pc) *
                    parameter(instr, 2, &prog, pc);
                pc += 4;
            },
            3 => {
                let idx = prog[pc + 1] as usize;
                prog[idx] = 5;  // hard coded value
                pc += 2;
            },
            4 => {
                println!("output: {}", parameter(instr, 1, &prog, pc));
                pc += 2;
            },
            5 => {
                if parameter(instr, 1, &prog, pc) != 0 {
                    pc = parameter(instr, 2, &prog, pc) as usize;
                } else {
                    pc += 3;
                }
            },
            6 => {
                if parameter(instr, 1, &prog, pc) == 0 {
                    pc = parameter(instr, 2, &prog, pc) as usize;
                } else {
                    pc += 3;
                }
            },
            7 => {
                let idx = prog[pc + 3] as usize;
                prog[idx] =
                    (
                        parameter(instr, 1, &prog, pc) <
                        parameter(instr, 2, &prog, pc)
                    ) as i64;
                pc += 4
            },
            8 => {
                let idx = prog[pc + 3] as usize;
                prog[idx] =
                    (
                        parameter(instr, 1, &prog, pc) ==
                        parameter(instr, 2, &prog, pc)
                    ) as i64;
                pc += 4
            },
            _ => panic!("unknown opc {}, {}, {:?}", opc, pc, prog),
        }
    }

    panic!("unreachable");
}
