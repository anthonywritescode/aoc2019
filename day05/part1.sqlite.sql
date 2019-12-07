-- our puzzle input
CREATE TABLE input (value STRING);
INSERT INTO input VALUES ('3,225,1,225,6,6,1100,1,238,225,104,0,1101,61,45,225,102,94,66,224,101,-3854,224,224,4,224,102,8,223,223,1001,224,7,224,1,223,224,223,1101,31,30,225,1102,39,44,224,1001,224,-1716,224,4,224,102,8,223,223,1001,224,7,224,1,224,223,223,1101,92,41,225,101,90,40,224,1001,224,-120,224,4,224,102,8,223,223,1001,224,1,224,1,223,224,223,1101,51,78,224,101,-129,224,224,4,224,1002,223,8,223,1001,224,6,224,1,224,223,223,1,170,13,224,101,-140,224,224,4,224,102,8,223,223,1001,224,4,224,1,223,224,223,1101,14,58,225,1102,58,29,225,1102,68,70,225,1002,217,87,224,101,-783,224,224,4,224,102,8,223,223,101,2,224,224,1,224,223,223,1101,19,79,225,1001,135,42,224,1001,224,-56,224,4,224,102,8,223,223,1001,224,6,224,1,224,223,223,2,139,144,224,1001,224,-4060,224,4,224,102,8,223,223,101,1,224,224,1,223,224,223,1102,9,51,225,4,223,99,0,0,0,677,0,0,0,0,0,0,0,0,0,0,0,1105,0,99999,1105,227,247,1105,1,99999,1005,227,99999,1005,0,256,1105,1,99999,1106,227,99999,1106,0,265,1105,1,99999,1006,0,99999,1006,227,274,1105,1,99999,1105,1,280,1105,1,99999,1,225,225,225,1101,294,0,0,105,1,0,1105,1,99999,1106,0,300,1105,1,99999,1,225,225,225,1101,314,0,0,106,0,0,1105,1,99999,1008,677,226,224,102,2,223,223,1006,224,329,101,1,223,223,108,677,677,224,102,2,223,223,1005,224,344,101,1,223,223,107,677,677,224,1002,223,2,223,1005,224,359,101,1,223,223,1107,226,677,224,1002,223,2,223,1005,224,374,1001,223,1,223,1008,677,677,224,102,2,223,223,1006,224,389,1001,223,1,223,1007,677,677,224,1002,223,2,223,1006,224,404,1001,223,1,223,8,677,226,224,102,2,223,223,1005,224,419,1001,223,1,223,8,226,226,224,102,2,223,223,1006,224,434,101,1,223,223,1107,226,226,224,1002,223,2,223,1006,224,449,101,1,223,223,1107,677,226,224,102,2,223,223,1005,224,464,101,1,223,223,1108,226,226,224,102,2,223,223,1006,224,479,1001,223,1,223,7,677,677,224,1002,223,2,223,1006,224,494,101,1,223,223,7,677,226,224,102,2,223,223,1005,224,509,101,1,223,223,1108,226,677,224,1002,223,2,223,1006,224,524,101,1,223,223,8,226,677,224,1002,223,2,223,1005,224,539,101,1,223,223,1007,226,226,224,102,2,223,223,1006,224,554,1001,223,1,223,108,226,226,224,1002,223,2,223,1006,224,569,1001,223,1,223,1108,677,226,224,102,2,223,223,1005,224,584,101,1,223,223,108,226,677,224,102,2,223,223,1005,224,599,101,1,223,223,1007,226,677,224,102,2,223,223,1006,224,614,1001,223,1,223,1008,226,226,224,1002,223,2,223,1006,224,629,1001,223,1,223,107,226,226,224,1002,223,2,223,1006,224,644,101,1,223,223,7,226,677,224,102,2,223,223,1005,224,659,1001,223,1,223,107,677,226,224,102,2,223,223,1005,224,674,1001,223,1,223,4,223,99,226');

-- convert the input into a table
CREATE TABLE prog (ROWID INT, i INT);
WITH RECURSIVE
    nn (ROWID, n, rest)
AS (
    SELECT
        0,
        (SELECT SUBSTR(input.value, 0, INSTR(input.value, ',')) FROM input),
        (SELECT SUBSTR(input.value, INSTR(input.value, ',') + 1) FROM input)
    UNION ALL
    SELECT
        nn.ROWID + 1,
        CASE INSTR(nn.rest, ',')
            WHEN 0 THEN nn.rest
            ELSE SUBSTR(nn.rest, 0, INSTR(nn.rest, ','))
        END,
        CASE INSTR(nn.rest, ',')
            WHEN 0 THEN ''
            ELSE SUBSTR(nn.rest, INSTR(nn.rest, ',') + 1)
        END
    FROM nn
    WHERE LENGTH(nn.rest) > 0
)
INSERT INTO prog (ROWID, i)
SELECT nn.ROWID, nn.n FROM nn;

-- we store output here
CREATE TABLE output (value INT);

-- to shorten the code
CREATE TABLE param (opc INT, param1 INT, param2 INT);
INSERT INTO param VALUES (0, 0, 0);

-- the program counter and stored procedure magic
CREATE TABLE pc (value INT);
PRAGMA recursive_triggers = on;
CREATE TEMP TRIGGER ttrig
AFTER UPDATE OF value ON pc
WHEN (SELECT prog.i FROM prog WHERE ROWID = NEW.value) != 99
BEGIN
    UPDATE param SET
    opc = (SELECT prog.i % 100 FROM prog WHERE ROWID = NEW.value),
    param1 = (
        CASE CAST(
            (SELECT prog.i FROM prog WHERE ROWID = NEW.value) / 100 AS INTEGER
        )  % 10
            WHEN 0 THEN (
                SELECT prog.i
                FROM prog
                WHERE ROWID = (
                    SELECT prog.i FROM prog WHERE ROWID = NEW.value + 1
                )
            )
            ELSE (SELECT prog.i FROM prog WHERE ROWID = NEW.value + 1)
        END
    ),
    param2 = (
        CASE CAST(
            (SELECT prog.i FROM prog WHERE ROWID = NEW.value) / 1000 AS INTEGER
        )  % 10
            WHEN 0 THEN (
                SELECT prog.i
                FROM prog
                WHERE ROWID = (
                    SELECT prog.i FROM prog WHERE ROWID = NEW.value + 2
                )
            )
            ELSE (SELECT prog.i FROM prog WHERE ROWID = NEW.value + 2)
        END
    );

    -- opcode 1
    -- -- operation (ADD)
    UPDATE prog
    SET i = (SELECT param.param1 FROM param) + (SELECT param.param2 FROM param)
    WHERE
        ROWID = (SELECT prog.i FROM prog WHERE ROWID = NEW.value + 3) AND
        (SELECT param.opc FROM param) = 1;

    -- opcode 2
    -- -- operation (MULT)
    UPDATE prog
    SET i = (SELECT param.param1 FROM param) * (SELECT param.param2 FROM param)
    WHERE
        ROWID = (SELECT prog.i FROM prog WHERE ROWID = NEW.value + 3) AND
        (SELECT param.opc FROM param) = 2;

    -- opcode 3
    -- -- operation (INPUT)
    UPDATE prog SET i = 1
    WHERE
        ROWID = (SELECT prog.i FROM prog WHERE ROWID = NEW.value + 1) AND
        (SELECT param.opc FROM param) = 3;

    -- opcode 4
    -- -- operation (OUTPUT)
    INSERT INTO output
    SELECT (SELECT param.param1 FROM param)
    WHERE (SELECT param.opc FROM param) = 4;

    -- pc update
    UPDATE pc SET value = NEW.value + (
        CASE (SELECT param.opc FROM param)
            WHEN 1 THEN 4
            WHEN 2 THEN 4
            WHEN 3 THEN 2
            WHEN 4 THEN 2
        END
    );
END;

-- trigger the code
INSERT INTO pc VALUES (-1);
UPDATE pc SET value = 0;

SELECT * FROM output;
