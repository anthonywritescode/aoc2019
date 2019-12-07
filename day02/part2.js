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

const prog =
    fs.readFileSync(process.argv[2], {encoding: 'UTF-8'})
        .trim()
        .split(/,/)
        .map((s) => parseInt(s, 10));

function main() {
    for (let noun = 0; noun < 100; noun += 1) {
        for (let verb = 0; verb < 100; verb += 1) {
            let progCopy = prog.slice();
            progCopy[1] = noun;
            progCopy[2] = verb;
            if (compute(progCopy) === 19690720) {
                return 100 * noun + verb;
            }
        }
    }
}

console.log(main());
