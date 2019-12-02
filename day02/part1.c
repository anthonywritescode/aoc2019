#include <assert.h>
#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

long compute(long* prog) {
    size_t pc = 0;
    while (true) {
        long opc = prog[pc];
        if (opc == 99) {
            return prog[0];
        } else if (opc == 1) {
            prog[prog[pc + 3]] = prog[prog[pc + 2]] + prog[prog[pc + 1]];
        } else if (opc == 2) {
            prog[prog[pc + 3]] = prog[prog[pc + 2]] * prog[prog[pc + 1]];
        } else {
            assert(!"unreachable");
        }
        pc += 4;
    }
    assert(!"unreachable");
}

int main(int argc, char* argv[]) {
    if (argc != 2) {
        fprintf(stderr, "usage: %s FILENAME\n", argv[0]);
        return 1;
    }

    FILE* f = fopen(argv[1], "r");
    if (f == NULL) {
        fprintf(stderr, "invalid filename: %s\n", argv[1]);
        return 1;
    }

    size_t size = 4;
    size_t idx = 0;
    long* arr = malloc(sizeof *arr * size);

    if (fscanf(f, "%ld", arr + idx) != 1) {
        fprintf(stderr, "expected numbers????\n");
        fclose(f);
        return 1;
    }
    idx += 1;

    while (fscanf(f, ",%ld", arr + idx) == 1) {
        idx += 1;
        if (idx >= size) {
            long* new_arr = malloc(sizeof *new_arr * size * 2);
            memcpy(new_arr, arr, sizeof *arr * size);
            free(arr);
            arr = new_arr;
            size *= 2;
        }
    }

    arr[1] = 12;
    arr[2] = 2;
    printf("%ld\n", compute(arr));

    free(arr);
    fclose(f);
    return 0;
}
