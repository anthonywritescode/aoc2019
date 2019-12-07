'use strict';

const fs = require('fs');

if (process.argv.length !== 3) {
    console.error(`usage: node ${process.argv[1]} FILENAME`);
    process.exit(1)
}


function compute(prog) {
    let pc = 0;
    for (;;) {
        const opc = prog[pc];
        switch (opc) {
            case 99:
                return prog[0];
            case 1:
                prog[prog[pc + 3]] = prog[prog[pc + 2]] + prog[prog[pc + 1]];
                break;
            case 2:
                prog[prog[pc + 3]] = prog[prog[pc + 2]] * prog[prog[pc + 1]];
                break;
            default:
                throw new Error('OHNOES!');
        }
        pc += 4;
    }
}

let prog =
    fs.readFileSync(process.argv[2], {encoding: 'UTF-8'})
        .trim()
        .split(/,/)
        .map((s) => parseInt(s, 10));

prog[1] = 12;
prog[2] = 2;

console.log(compute(prog));
