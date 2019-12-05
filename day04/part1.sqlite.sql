DROP TABLE IF EXISTS input;
DROP TABLE IF EXISTS range;
DROP TABLE IF EXISTS ints;

-- our puzzle input
CREATE TABLE input (value STRING);
INSERT INTO input VALUES ('134564-585159');

-- we'll store the integer range derived from our puzzle input
CREATE TABLE range (start INT NOT NULL, end INT NOT NULL);
INSERT INTO range (start, end)
SELECT
    SUBSTR(input.value, 0, INSTR(input.value, '-')),
    SUBSTR(input.value, INSTR(input.value, '-') + 1)
FROM input;

-- here's the magic to create our integers table
-- adapted from https://stackoverflow.com/a/38821165/812183
CREATE TABLE ints (i INT);
WITH RECURSIVE
  nn (n)
as (
    SELECT (SELECT range.start FROM range)
    UNION ALL
    SELECT n + 1 AS newn FROM nn
    WHERE newn <= (SELECT range.end FROM range)
)
INSERT INTO ints
SELECT nn.n FROM nn;

SELECT COUNT(1) FROM ints
WHERE
    LENGTH(ints.i) = 6 AND
    (
        ints.i LIKE '%00%' OR
        ints.i LIKE '%11%' OR
        ints.i LIKE '%22%' OR
        ints.i LIKE '%33%' OR
        ints.i LIKE '%44%' OR
        ints.i LIKE '%55%' OR
        ints.i LIKE '%66%' OR
        ints.i LIKE '%77%' OR
        ints.i LIKE '%88%' OR
        ints.i LIKE '%99%'
    ) AND (
        SUBSTR(ints.i, 1, 1) <= SUBSTR(ints.i, 2, 1) AND
        SUBSTR(ints.i, 2, 1) <= SUBSTR(ints.i, 3, 1) AND
        SUBSTR(ints.i, 3, 1) <= SUBSTR(ints.i, 4, 1) AND
        SUBSTR(ints.i, 4, 1) <= SUBSTR(ints.i, 5, 1) AND
        SUBSTR(ints.i, 5, 1) <= SUBSTR(ints.i, 6, 1)
    )
;
