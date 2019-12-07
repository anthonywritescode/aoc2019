'use strict';

const fs = require('fs');

if (process.argv.length !== 3) {
    console.error(`usage: node ${process.argv[1]} FILENAME`);
    process.exit(1)
}


function compute(prog, fn) {
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
                prog[prog[pc + 1]] = 1;  // hardcoded value from puzzle
                pc += 2;
                break;
            case 4:
                fn(parameter(instr, 1));
                pc += 2;
                break;
            default:
                throw new Error('OHNOES!');
        }
    }
}

const prog =
    fs.readFileSync(process.argv[2], {encoding: 'UTF-8'})
        .trim()
        .split(/,/)
        .map((s) => parseInt(s, 10));

compute(prog, console.log);
