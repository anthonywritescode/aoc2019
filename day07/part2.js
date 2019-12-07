'use strict';

const fs = require('fs');

if (process.argv.length !== 3) {
    console.error(`usage: node ${process.argv[1]} FILENAME`);
    process.exit(1)
}


function compute(prog, pc, val) {
    pc = pc || 0;

    function parameter(instr, n) {
        const mode = Math.trunc(instr / (10 ** (n + 1))) % 10;
        switch (mode) {
            case 0:
                return prog[prog[pc + n]];
            case 1:
                return prog[pc + n];
            default:
                throw new Error('OHNOSE!!!');
        }
    }

    for (;;) {
        const instr = prog[pc];
        const opc = instr % 100;
        switch (opc) {
            case 99:
                return [undefined, undefined, undefined, true];
            case 1:
                prog[prog[pc + 3]] = parameter(instr, 1) + parameter(instr, 2);
                pc += 4;
                break;
            case 2:
                prog[prog[pc + 3]] = parameter(instr, 1) * parameter(instr, 2);
                pc += 4;
                break;
            case 3:
                if (val === undefined) {
                    return [prog, pc, undefined, false];
                } else {
                    prog[prog[pc + 1]] = val;
                    val = undefined;
                    pc += 2;
                }
                break;
            case 4:
                return [prog, pc + 2, parameter(instr, 1), false];
            case 5:
                if (parameter(instr, 1)) {
                    pc = parameter(instr, 2);
                } else {
                    pc += 3;
                }
                break;
            case 6:
                if (!parameter(instr, 1)) {
                    pc = parameter(instr, 2);
                } else {
                    pc += 3;
                }
                break;
            case 7:
                if (parameter(instr, 1) < parameter(instr, 2)) {
                    prog[prog[pc + 3]] = 1;
                } else {
                    prog[prog[pc + 3]] = 0;
                }
                pc += 4;
                break;
            case 8:
                if (parameter(instr, 1) === parameter(instr, 2)) {
                    prog[prog[pc + 3]] = 1;
                } else {
                    prog[prog[pc + 3]] = 0;
                }
                pc += 4;
                break;
            default:
                throw new Error(`OHNOES! ${pc} wat`);
        }
    }
}

function permutations(inputArr) {
    // siq copy pasta from https://stackoverflow.com/a/20871714/812183
    let result = [];

    const permute = (arr, m = []) => {
        if (arr.length === 0) {
            result.push(m)
        } else {
            for (let i = 0; i < arr.length; i++) {
                let curr = arr.slice();
                let next = curr.splice(i, 1);
                permute(curr.slice(), m.concat(next))
            }
        }
    }

    permute(inputArr)

    return result;
}

const prog =
    fs.readFileSync(process.argv[2], {encoding: 'UTF-8'})
        .trim()
        .split(/,/)
        .map((s) => parseInt(s, 10));

let outputs = [];
let permuted = permutations([...Array(10).keys()].slice(5));
for (const permutation of permuted) {
    const progs = permutation.map((n) => compute(prog.slice(), 0, n));
    let i = 0;

    let val =  0;
    for (;;) {
        let [prog, pc, val2, halted] = progs[i];
        [prog, pc, val2, halted] = compute(prog, pc, val);
        if (halted) {
            break;
        } else {
            val = val2;
        }
        progs[i] = [prog, pc, val, halted];

        i += 1;
        i %= progs.length;
    }
    outputs.push(val);
}
console.log(Math.max.apply(null, outputs));
