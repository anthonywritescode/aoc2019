-- our puzzle input
CREATE TABLE input (value STRING);
INSERT INTO input VALUES ('1,0,0,3,1,1,2,3,1,3,4,3,1,5,0,3,2,9,1,19,1,19,6,23,2,6,23,27,2,27,9,31,1,5,31,35,1,35,10,39,2,39,9,43,1,5,43,47,2,47,10,51,1,51,6,55,1,5,55,59,2,6,59,63,2,63,6,67,1,5,67,71,1,71,9,75,2,75,10,79,1,79,5,83,1,10,83,87,1,5,87,91,2,13,91,95,1,95,10,99,2,99,13,103,1,103,5,107,1,107,13,111,2,111,9,115,1,6,115,119,2,119,6,123,1,123,6,127,1,127,9,131,1,6,131,135,1,135,2,139,1,139,10,0,99,2,0,14,0');
-- INSERT INTO input VALUES ('1,0,0,0,99');
-- INSERT INTO input VALUES ('1,1,1,4,99,5,6,0,99');

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

-- the program counter and stored procedure magic
CREATE TABLE pc (value INT);
PRAGMA recursive_triggers = on;
CREATE TEMP TRIGGER ttrig
AFTER UPDATE OF value ON pc
WHEN (SELECT prog.i FROM prog WHERE ROWID = NEW.value)
BEGIN
    UPDATE prog
    SET i = (
        CASE (SELECT prog.i FROM prog WHERE ROWID = NEW.value)
            WHEN 1 THEN (
                (
                    SELECT prog.i
                    FROM prog
                    WHERE ROWID = (
                        SELECT prog.i FROM prog WHERE ROWID = NEW.value + 1
                    )
                ) +
                (
                    SELECT prog.i
                    FROM prog
                    WHERE ROWID = (
                        SELECT prog.i FROM prog WHERE ROWID = NEW.value + 2
                    )
                )
            )
            WHEN 2 THEN (
                (
                    SELECT prog.i
                    FROM prog
                    WHERE ROWID = (
                        SELECT prog.i FROM prog WHERE ROWID = NEW.value + 1
                    )
                ) *
                (
                    SELECT prog.i
                    FROM prog
                    WHERE ROWID = (
                        SELECT prog.i FROM prog WHERE ROWID = NEW.value + 2
                    )
                )
            )
        END
    )
    WHERE ROWID = (SELECT prog.i FROM prog WHERE ROWID = NEW.value + 3);
    UPDATE pc SET value = NEW.value + 4;
END;

-- seed 1 and 2
UPDATE prog SET i = 12 WHERE ROWID = 1;
UPDATE prog SET i = 2 WHERE ROWID = 2;

-- INSERT INTO pc VALUES (0);
INSERT INTO pc VALUES (-1);
UPDATE pc SET value = 0;

SELECT prog.i FROM prog WHERE ROWID = 0;
