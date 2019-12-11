-- our puzzle input
CREATE TABLE input (value STRING);
INSERT INTO input VALUES ('1102,34463338,34463338,63,1007,63,34463338,63,1005,63,53,1101,3,0,1000,109,988,209,12,9,1000,209,6,209,3,203,0,1008,1000,1,63,1005,63,65,1008,1000,2,63,1005,63,904,1008,1000,0,63,1005,63,58,4,25,104,0,99,4,0,104,0,99,4,17,104,0,99,0,0,1101,35,0,1007,1102,30,1,1013,1102,37,1,1017,1101,23,0,1006,1101,0,32,1008,1102,1,29,1000,1101,0,38,1010,1101,0,24,1002,1101,33,0,1003,1101,1,0,1021,1102,31,1,1019,1101,27,0,1014,1102,20,1,1005,1101,0,0,1020,1102,1,892,1027,1101,895,0,1026,1102,39,1,1015,1102,1,370,1029,1102,1,28,1001,1102,34,1,1012,1101,25,0,1016,1101,0,375,1028,1101,36,0,1018,1101,0,21,1004,1102,1,26,1009,1101,0,249,1022,1101,0,660,1025,1101,0,665,1024,1102,1,22,1011,1102,242,1,1023,109,5,2102,1,3,63,1008,63,31,63,1005,63,205,1001,64,1,64,1105,1,207,4,187,1002,64,2,64,109,8,21102,40,1,5,1008,1018,37,63,1005,63,227,1105,1,233,4,213,1001,64,1,64,1002,64,2,64,109,7,2105,1,3,1001,64,1,64,1106,0,251,4,239,1002,64,2,64,109,-7,1201,-7,0,63,1008,63,20,63,1005,63,271,1106,0,277,4,257,1001,64,1,64,1002,64,2,64,109,-10,1208,0,33,63,1005,63,295,4,283,1106,0,299,1001,64,1,64,1002,64,2,64,109,-6,1207,4,27,63,1005,63,319,1001,64,1,64,1105,1,321,4,305,1002,64,2,64,109,12,1207,-1,33,63,1005,63,339,4,327,1105,1,343,1001,64,1,64,1002,64,2,64,109,6,1206,6,355,1106,0,361,4,349,1001,64,1,64,1002,64,2,64,109,21,2106,0,-8,4,367,1106,0,379,1001,64,1,64,1002,64,2,64,109,-29,1202,0,1,63,1008,63,36,63,1005,63,403,1001,64,1,64,1105,1,405,4,385,1002,64,2,64,109,11,21107,41,40,-6,1005,1012,421,1105,1,427,4,411,1001,64,1,64,1002,64,2,64,109,-11,2101,0,-4,63,1008,63,33,63,1005,63,453,4,433,1001,64,1,64,1106,0,453,1002,64,2,64,109,-7,21108,42,40,10,1005,1010,469,1105,1,475,4,459,1001,64,1,64,1002,64,2,64,109,1,1201,4,0,63,1008,63,20,63,1005,63,497,4,481,1105,1,501,1001,64,1,64,1002,64,2,64,109,5,21107,43,44,5,1005,1011,523,4,507,1001,64,1,64,1106,0,523,1002,64,2,64,109,20,21108,44,44,-7,1005,1019,541,4,529,1106,0,545,1001,64,1,64,1002,64,2,64,109,2,1205,-8,561,1001,64,1,64,1106,0,563,4,551,1002,64,2,64,109,-23,2108,22,0,63,1005,63,583,1001,64,1,64,1105,1,585,4,569,1002,64,2,64,109,-6,2107,30,1,63,1005,63,605,1001,64,1,64,1105,1,607,4,591,1002,64,2,64,109,23,1205,-1,621,4,613,1105,1,625,1001,64,1,64,1002,64,2,64,109,-19,2102,1,-3,63,1008,63,29,63,1005,63,647,4,631,1106,0,651,1001,64,1,64,1002,64,2,64,109,28,2105,1,-7,4,657,1106,0,669,1001,64,1,64,1002,64,2,64,109,-17,1206,6,687,4,675,1001,64,1,64,1105,1,687,1002,64,2,64,109,2,21101,45,0,1,1008,1017,42,63,1005,63,707,1106,0,713,4,693,1001,64,1,64,1002,64,2,64,109,-6,2101,0,-3,63,1008,63,34,63,1005,63,733,1105,1,739,4,719,1001,64,1,64,1002,64,2,64,109,3,21101,46,0,1,1008,1014,46,63,1005,63,761,4,745,1106,0,765,1001,64,1,64,1002,64,2,64,109,5,21102,47,1,-7,1008,1011,47,63,1005,63,787,4,771,1105,1,791,1001,64,1,64,1002,64,2,64,109,-24,2108,24,8,63,1005,63,813,4,797,1001,64,1,64,1106,0,813,1002,64,2,64,109,5,1208,10,29,63,1005,63,829,1105,1,835,4,819,1001,64,1,64,1002,64,2,64,109,7,2107,23,-4,63,1005,63,853,4,841,1105,1,857,1001,64,1,64,1002,64,2,64,109,-2,1202,0,1,63,1008,63,21,63,1005,63,879,4,863,1105,1,883,1001,64,1,64,1002,64,2,64,109,15,2106,0,8,1106,0,901,4,889,1001,64,1,64,4,64,99,21102,1,27,1,21102,915,1,0,1105,1,922,21201,1,51839,1,204,1,99,109,3,1207,-2,3,63,1005,63,964,21201,-2,-1,1,21101,942,0,0,1106,0,922,21201,1,0,-1,21201,-2,-3,1,21101,957,0,0,1105,1,922,22201,1,-1,-2,1105,1,968,21201,-2,0,-2,109,-3,2106,0,0');

-- convert the input into a table
CREATE TABLE prog (ROWID INT, i INT);
CREATE UNIQUE INDEX prob_idx ON prog(ROWID);
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

-- to limit recursion
CREATE TABLE opcount (value INT);
INSERT INTO opcount VALUES (0);

-- we store output here
CREATE TABLE output (value INT);

-- to shorten the code
CREATE TABLE param (opc INT, param1 INT, param2 INT, store1 INT, store3 INT);
INSERT INTO param VALUES (0, 0, 0, 0, 0);

-- the program counter and stored procedure magic
CREATE TABLE pc (value INT);
INSERT INTO pc VALUES (0);
CREATE TABLE rb (value INT);
INSERT INTO rb VALUES (0);
PRAGMA recursive_triggers = on;
CREATE TEMP TRIGGER ttrig
AFTER UPDATE OF value ON pc
WHEN (SELECT prog.i FROM prog WHERE ROWID = NEW.value) != 99 AND (SELECT opcount.value FROM opcount) < 250
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
            WHEN 1 THEN (SELECT prog.i FROM prog WHERE ROWID = NEW.value + 1)
            WHEN 2 THEN (
                SELECT prog.i
                FROM prog
                WHERE ROWID = (SELECT rb.value FROM rb) + (
                    SELECT prog.i FROM prog WHERE ROWID = NEW.value + 1
                )
            )
            ELSE NULL
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
            WHEN 1 THEN (SELECT prog.i FROM prog WHERE ROWID = NEW.value + 2)
            WHEN 2 THEN (
                SELECT prog.i
                FROM prog
                WHERE ROWID = (SELECT rb.value FROM rb) + (
                    SELECT prog.i FROM prog WHERE ROWID = NEW.value + 2
                )
            )
            ELSE NULL
        END
    ),
    store1 = (
        CASE CAST(
            (SELECT prog.i FROM prog WHERE ROWID = NEW.value) / 100 AS INTEGER
        )  % 10
            WHEN 0 THEN (SELECT prog.i FROM prog WHERE ROWID = NEW.value + 1)
            WHEN 2 THEN (
                (SELECT rb.value FROM rb) +
                (SELECT prog.i FROM prog WHERE ROWID = NEW.value + 1)
            )
            ELSE NULL
        END
    ),
    store3 = (
        CASE CAST(
            (SELECT prog.i FROM prog WHERE ROWID = NEW.value) / 10000 AS INTEGER
        )  % 10
            WHEN 0 THEN (SELECT prog.i FROM prog WHERE ROWID = NEW.value + 3)
            WHEN 2 THEN (
                (SELECT rb.value FROM rb) +
                (SELECT prog.i FROM prog WHERE ROWID = NEW.value + 3)
            )
        END
    );
    UPDATE param SET
        param1 = COALESCE(param1, 0),
        param2 = COALESCE(param2, 0),
        store1 = COALESCE(store1, 0),
        store3 = COALESCE(store3, 0);

    UPDATE opcount SET value = value + 1;

    -- opcode 1
    -- -- operation (ADD)
    INSERT OR REPLACE INTO prog (ROWID, i)
    SELECT
        (SELECT param.store3 FROM param),
        (SELECT param.param1 FROM param) + (SELECT param.param2 FROM param)
    WHERE (SELECT param.opc FROM param) = 1;

    -- opcode 2
    -- -- operation (MULT)
    INSERT OR REPLACE INTO prog (ROWID, i)
    SELECT
        (SELECT param.store3 FROM param),
        (SELECT param.param1 FROM param) * (SELECT param.param2 FROM param)
    WHERE (SELECT param.opc FROM param) = 2;

    -- opcode 3
    -- -- operation (INPUT)
    INSERT OR REPLACE INTO prog (ROWID, i)
    SELECT (SELECT param.store1 FROM param), 2
    WHERE (SELECT param.opc FROM param) = 3;

    -- opcode 4
    -- -- operation (OUTPUT)
    INSERT INTO output
    SELECT (SELECT param.param1 FROM param)
    WHERE (SELECT param.opc FROM param) = 4;

    -- opcode 5 (below)
    -- opcode 6 (below)

    -- opcode 7
    -- -- operation (LT)
    INSERT OR REPLACE INTO prog (ROWID, i)
    SELECT
        (SELECT param.store3 FROM param),
        (SELECT param.param1 FROM param) < (SELECT param.param2 FROM param)
    WHERE (SELECT param.opc FROM param) = 7;

    -- opcode 8
    -- -- operation (EQ)
    INSERT OR REPLACE INTO prog (ROWID, i)
    SELECT
        (SELECT param.store3 FROM param),
        (SELECT param.param1 FROM param) = (SELECT param.param2 FROM param)
    WHERE (SELECT param.opc FROM param) = 8;

    -- opcode 9
    UPDATE rb SET value = value + (SELECT param.param1 FROM param)
    WHERE (SELECT param.opc FROM param) = 9;

    -- pc update
    UPDATE pc SET value = (
        CASE (SELECT param.opc FROM param)
            WHEN 1 THEN NEW.value + 4
            WHEN 2 THEN NEW.value + 4
            WHEN 3 THEN NEW.value + 2
            WHEN 4 THEN NEW.value + 2
            -- opcode 5 (JUMP IF TRUE)
            WHEN 5 THEN (
                CASE NOT NOT (SELECT param.param1 FROM param)
                    WHEN 1 THEN (SELECT param.param2 FROM param)
                    ELSE NEW.value + 3
                END
            )
            -- opcode 6 (JUMP IF FALSE)
            WHEN 6 THEN (
                CASE NOT (SELECT param.param1 FROM param)
                    WHEN 1 THEN (SELECT param.param2 FROM param)
                    ELSE NEW.value + 3
                END
            )
            WHEN 7 THEN NEW.value + 4
            WHEN 8 THEN NEW.value + 4
            WHEN 9 THEN NEW.value + 2
        END
    );
END;

-- trigger the code
-- XXX: sqlite experiences exponential slowdown on recursive triggers
-- XXX: so we trigger it a bunch of times with a limited depth
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 2 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 3 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 4 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 5 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 6 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 7 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 8 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 9 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 10 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 11 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 12 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 13 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 14 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 15 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 16 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 17 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 18 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 19 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 20 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 21 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 22 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 23 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 24 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 25 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 26 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 27 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 28 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 29 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 30 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 31 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 32 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 33 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 34 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 35 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 36 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 37 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 38 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 39 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 40 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 41 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 42 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 43 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 44 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 45 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 46 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 47 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 48 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 49 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 50 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 51 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 52 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 53 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 54 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 55 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 56 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 57 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 58 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 59 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 60 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 61 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 62 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 63 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 64 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 65 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 66 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 67 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 68 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 69 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 70 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 71 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 72 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 73 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 74 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 75 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 76 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 77 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 78 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 79 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 80 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 81 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 82 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 83 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 84 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 85 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 86 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 87 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 88 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 89 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 90 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 91 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 92 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 93 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 94 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 95 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 96 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 97 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 98 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 99 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 100 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 101 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 102 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 103 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 104 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 105 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 106 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 107 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 108 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 109 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 110 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 111 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 112 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 113 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 114 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 115 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 116 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 117 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 118 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 119 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 120 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 121 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 122 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 123 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 124 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 125 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 126 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 127 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 128 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 129 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 130 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 131 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 132 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 133 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 134 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 135 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 136 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 137 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 138 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 139 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 140 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 141 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 142 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 143 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 144 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 145 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 146 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 147 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 148 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 149 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 150 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 151 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 152 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 153 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 154 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 155 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 156 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 157 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 158 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 159 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 160 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 161 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 162 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 163 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 164 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 165 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 166 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 167 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 168 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 169 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 170 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 171 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 172 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 173 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 174 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 175 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 176 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 177 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 178 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 179 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 180 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 181 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 182 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 183 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 184 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 185 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 186 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 187 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 188 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 189 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 190 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 191 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 192 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 193 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 194 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 195 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 196 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 197 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 198 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 199 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 200 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 201 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 202 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 203 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 204 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 205 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 206 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 207 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 208 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 209 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 210 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 211 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 212 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 213 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 214 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 215 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 216 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 217 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 218 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 219 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 220 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 221 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 222 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 223 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 224 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 225 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 226 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 227 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 228 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 229 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 230 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 231 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 232 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 233 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 234 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 235 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 236 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 237 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 238 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 239 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 240 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 241 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 242 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 243 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 244 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 245 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 246 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 247 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 248 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 249 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 250 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 251 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 252 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 253 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 254 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 255 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 256 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 257 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 258 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 259 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 260 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 261 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 262 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 263 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 264 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 265 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 266 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 267 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 268 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 269 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 270 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 271 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 272 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 273 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 274 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 275 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 276 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 277 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 278 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 279 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 280 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 281 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 282 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 283 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 284 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 285 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 286 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 287 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 288 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 289 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 290 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 291 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 292 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 293 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 294 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 295 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 296 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 297 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 298 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 299 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 300 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 301 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 302 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 303 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 304 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 305 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 306 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 307 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 308 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 309 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 310 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 311 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 312 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 313 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 314 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 315 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 316 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 317 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 318 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 319 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 320 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 321 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 322 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 323 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 324 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 325 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 326 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 327 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 328 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 329 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 330 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 331 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 332 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 333 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 334 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 335 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 336 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 337 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 338 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 339 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 340 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 341 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 342 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 343 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 344 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 345 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 346 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 347 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 348 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 349 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 350 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 351 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 352 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 353 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 354 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 355 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 356 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 357 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 358 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 359 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 360 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 361 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 362 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 363 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 364 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 365 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 366 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 367 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 368 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 369 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 370 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 371 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 372 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 373 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 374 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 375 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 376 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 377 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 378 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 379 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 380 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 381 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 382 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 383 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 384 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 385 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 386 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 387 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 388 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 389 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 390 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 391 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 392 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 393 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 394 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 395 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 396 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 397 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 398 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 399 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 400 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 401 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 402 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 403 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 404 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 405 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 406 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 407 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 408 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 409 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 410 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 411 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 412 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 413 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 414 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 415 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 416 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 417 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 418 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 419 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 420 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 421 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 422 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 423 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 424 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 425 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 426 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 427 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 428 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 429 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 430 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 431 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 432 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 433 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 434 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 435 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 436 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 437 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 438 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 439 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 440 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 441 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 442 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 443 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 444 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 445 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 446 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 447 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 448 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 449 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 450 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 451 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 452 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 453 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 454 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 455 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 456 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 457 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 458 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 459 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 460 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 461 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 462 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 463 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 464 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 465 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 466 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 467 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 468 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 469 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 470 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 471 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 472 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 473 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 474 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 475 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 476 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 477 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 478 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 479 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 480 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 481 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 482 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 483 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 484 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 485 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 486 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 487 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 488 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 489 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 490 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 491 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 492 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 493 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 494 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 495 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 496 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 497 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 498 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 499 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 500 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 501 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 502 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 503 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 504 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 505 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 506 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 507 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 508 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 509 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 510 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 511 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 512 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 513 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 514 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 515 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 516 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 517 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 518 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 519 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 520 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 521 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 522 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 523 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 524 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 525 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 526 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 527 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 528 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 529 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 530 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 531 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 532 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 533 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 534 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 535 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 536 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 537 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 538 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 539 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 540 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 541 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 542 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 543 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 544 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 545 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 546 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 547 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 548 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 549 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 550 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 551 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 552 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 553 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 554 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 555 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 556 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 557 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 558 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 559 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 560 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 561 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 562 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 563 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 564 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 565 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 566 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 567 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 568 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 569 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 570 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 571 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 572 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 573 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 574 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 575 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 576 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 577 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 578 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 579 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 580 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 581 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 582 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 583 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 584 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 585 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 586 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 587 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 588 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 589 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 590 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 591 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 592 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 593 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 594 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 595 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 596 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 597 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 598 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 599 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 600 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 601 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 602 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 603 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 604 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 605 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 606 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 607 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 608 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 609 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 610 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 611 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 612 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 613 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 614 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 615 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 616 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 617 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 618 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 619 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 620 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 621 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 622 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 623 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 624 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 625 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 626 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 627 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 628 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 629 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 630 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 631 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 632 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 633 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 634 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 635 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 636 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 637 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 638 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 639 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 640 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 641 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 642 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 643 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 644 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 645 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 646 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 647 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 648 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 649 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 650 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 651 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 652 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 653 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 654 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 655 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 656 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 657 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 658 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 659 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 660 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 661 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 662 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 663 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 664 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 665 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 666 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 667 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 668 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 669 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 670 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 671 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 672 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 673 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 674 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 675 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 676 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 677 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 678 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 679 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 680 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 681 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 682 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 683 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 684 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 685 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 686 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 687 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 688 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 689 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 690 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 691 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 692 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 693 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 694 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 695 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 696 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 697 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 698 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 699 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 700 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 701 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 702 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 703 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 704 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 705 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 706 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 707 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 708 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 709 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 710 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 711 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 712 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 713 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 714 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 715 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 716 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 717 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 718 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 719 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 720 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 721 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 722 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 723 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 724 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 725 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 726 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 727 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 728 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 729 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 730 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 731 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 732 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 733 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 734 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 735 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 736 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 737 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 738 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 739 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 740 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 741 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 742 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 743 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 744 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 745 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 746 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 747 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 748 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 749 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 750 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 751 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 752 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 753 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 754 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 755 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 756 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 757 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 758 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 759 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 760 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 761 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 762 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 763 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 764 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 765 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 766 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 767 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 768 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 769 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 770 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 771 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 772 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 773 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 774 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 775 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 776 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 777 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 778 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 779 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 780 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 781 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 782 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 783 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 784 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 785 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 786 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 787 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 788 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 789 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 790 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 791 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 792 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 793 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 794 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 795 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 796 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 797 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 798 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 799 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 800 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 801 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 802 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 803 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 804 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 805 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 806 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 807 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 808 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 809 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 810 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 811 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 812 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 813 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 814 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 815 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 816 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 817 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 818 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 819 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 820 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 821 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 822 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 823 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 824 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 825 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 826 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 827 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 828 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 829 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 830 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 831 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 832 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 833 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 834 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 835 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 836 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 837 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 838 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 839 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 840 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 841 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 842 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 843 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 844 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 845 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 846 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 847 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 848 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 849 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 850 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 851 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 852 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 853 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 854 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 855 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 856 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 857 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 858 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 859 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 860 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 861 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 862 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 863 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 864 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 865 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 866 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 867 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 868 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 869 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 870 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 871 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 872 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 873 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 874 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 875 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 876 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 877 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 878 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 879 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 880 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 881 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 882 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 883 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 884 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 885 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 886 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 887 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 888 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 889 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 890 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 891 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 892 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 893 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 894 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 895 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 896 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 897 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 898 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 899 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 900 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 901 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 902 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 903 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 904 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 905 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 906 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 907 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 908 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 909 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 910 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 911 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 912 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 913 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 914 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 915 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 916 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 917 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 918 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 919 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 920 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 921 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 922 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 923 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 924 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 925 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 926 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 927 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 928 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 929 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 930 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 931 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 932 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 933 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 934 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 935 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 936 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 937 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 938 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 939 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 940 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 941 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 942 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 943 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 944 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 945 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 946 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 947 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 948 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 949 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 950 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 951 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 952 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 953 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 954 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 955 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 956 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 957 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 958 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 959 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 960 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 961 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 962 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 963 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 964 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 965 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 966 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 967 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 968 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 969 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 970 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 971 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 972 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 973 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 974 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 975 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 976 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 977 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 978 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 979 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 980 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 981 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 982 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 983 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 984 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 985 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 986 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 987 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 988 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 989 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 990 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 991 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 992 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 993 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 994 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 995 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 996 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 997 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 998 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 999 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1000 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1001 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1002 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1003 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1004 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1005 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1006 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1007 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1008 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1009 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1010 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1011 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1012 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1013 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1014 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1015 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1016 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1017 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1018 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1019 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1020 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1021 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1022 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1023 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1024 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1025 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1026 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1027 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1028 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1029 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1030 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1031 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1032 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1033 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1034 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1035 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1036 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1037 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1038 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1039 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1040 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1041 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1042 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1043 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1044 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1045 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1046 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1047 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1048 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1049 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1050 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1051 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1052 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1053 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1054 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1055 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1056 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1057 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1058 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1059 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1060 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1061 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1062 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1063 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1064 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1065 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1066 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1067 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1068 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1069 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1070 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1071 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1072 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1073 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1074 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1075 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1076 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1077 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1078 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1079 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1080 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1081 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1082 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1083 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1084 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1085 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1086 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1087 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1088 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1089 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1090 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1091 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1092 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1093 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1094 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1095 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1096 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1097 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1098 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1099 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1100 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1101 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1102 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1103 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1104 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1105 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1106 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1107 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1108 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1109 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1110 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1111 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1112 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1113 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1114 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1115 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1116 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1117 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1118 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1119 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1120 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1121 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1122 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1123 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1124 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1125 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1126 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1127 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1128 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1129 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1130 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1131 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1132 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1133 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1134 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1135 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1136 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1137 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1138 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1139 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1140 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1141 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1142 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1143 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1144 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1145 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1146 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1147 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1148 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1149 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1150 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1151 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1152 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1153 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1154 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1155 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1156 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1157 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1158 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1159 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1160 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1161 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1162 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1163 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1164 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1165 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1166 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1167 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1168 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1169 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1170 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1171 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1172 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1173 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1174 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1175 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1176 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1177 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1178 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1179 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1180 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1181 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1182 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1183 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1184 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1185 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1186 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1187 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1188 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1189 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1190 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1191 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1192 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1193 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1194 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1195 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1196 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1197 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1198 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1199 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1200 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1201 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1202 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1203 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1204 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1205 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1206 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1207 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1208 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1209 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1210 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1211 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1212 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1213 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1214 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1215 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1216 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1217 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1218 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1219 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1220 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1221 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1222 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1223 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1224 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1225 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1226 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1227 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1228 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1229 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1230 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1231 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1232 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1233 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1234 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1235 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1236 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1237 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1238 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1239 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1240 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1241 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1242 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1243 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1244 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1245 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1246 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1247 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1248 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1249 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1250 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1251 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1252 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1253 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1254 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1255 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1256 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1257 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1258 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1259 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1260 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1261 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1262 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1263 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1264 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1265 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1266 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1267 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1268 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1269 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1270 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1271 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1272 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1273 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1274 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1275 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1276 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1277 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1278 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1279 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1280 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1281 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1282 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1283 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1284 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1285 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1286 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1287 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1288 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1289 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1290 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1291 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1292 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1293 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1294 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1295 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1296 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1297 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1298 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1299 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1300 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1301 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1302 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1303 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1304 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1305 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1306 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1307 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1308 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1309 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1310 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1311 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1312 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1313 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1314 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1315 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1316 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1317 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1318 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1319 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1320 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1321 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1322 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1323 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1324 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1325 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1326 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1327 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1328 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1329 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1330 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1331 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1332 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1333 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1334 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1335 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1336 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1337 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1338 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1339 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1340 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1341 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1342 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1343 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1344 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1345 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1346 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1347 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1348 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1349 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1350 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1351 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1352 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1353 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1354 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1355 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1356 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1357 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1358 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1359 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1360 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1361 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1362 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1363 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1364 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1365 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1366 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1367 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1368 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1369 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1370 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1371 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1372 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1373 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1374 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1375 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1376 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1377 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1378 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1379 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1380 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1381 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1382 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1383 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1384 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1385 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1386 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1387 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1388 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1389 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1390 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1391 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1392 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1393 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1394 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1395 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1396 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1397 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1398 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1399 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1400 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1401 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1402 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1403 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1404 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1405 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1406 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1407 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1408 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1409 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1410 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1411 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1412 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1413 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1414 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1415 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1416 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1417 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1418 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1419 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1420 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1421 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1422 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1423 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1424 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1425 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1426 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1427 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1428 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1429 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1430 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1431 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1432 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1433 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1434 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1435 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1436 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1437 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1438 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1439 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1440 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1441 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1442 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1443 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1444 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1445 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1446 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1447 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1448 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1449 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1450 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1451 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1452 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1453 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1454 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1455 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1456 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1457 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1458 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1459 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1460 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1461 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1462 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1463 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1464 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1465 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1466 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1467 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1468 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1469 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1470 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1471 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1472 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1473 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1474 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1475 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1476 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1477 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1478 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1479 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1480 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1481 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1482 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1483 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1484 / 1485, 2) || '%';
UPDATE opcount SET value = 0; UPDATE pc SET value = value; SELECT ROUND(100.0 * 1485 / 1485, 2) || '%';

SELECT * FROM output;
