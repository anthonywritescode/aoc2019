'use strict';

const fs = require('fs');

if (process.argv.length !== 3) {
    console.error(`usage: node ${process.argv[1]} FILENAME`);
    process.exit(1)
}


function compute(prog, inCallback, outCallback) {
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

    let pc = 0;
    for (;;) {
        const instr = prog[pc];
        const opc = instr % 100;
        switch (opc) {
            case 99:
                return prog[0];
            case 1:
                prog[prog[pc + 3]] = parameter(instr, 1) + parameter(instr, 2);
                pc += 4;
                break;
            case 2:
                prog[prog[pc + 3]] = parameter(instr, 1) * parameter(instr, 2);
                pc += 4;
                break;
            case 3:
                prog[prog[pc + 1]] = inCallback();
                pc += 2;
                break;
            case 4:
                outCallback(parameter(instr, 1));
                pc += 2;
                break;
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
                throw new Error('OHNOES!');
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
let permuted = permutations([...Array(5).keys()]);
for (const permutation of permuted) {
    let val =  0;

    for (const n of permutation) {
        let vals = [val, n];
        compute(prog.slice(), () => vals.pop(), (n) => (val = n));
    }
    outputs.push(val);
}
console.log(Math.max.apply(null, outputs));
