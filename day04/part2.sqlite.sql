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
        (ints.i LIKE '%00%' AND NOT ints.i LIKE '%000%') OR
        (ints.i LIKE '%11%' AND NOT ints.i LIKE '%111%') OR
        (ints.i LIKE '%22%' AND NOT ints.i LIKE '%222%') OR
        (ints.i LIKE '%33%' AND NOT ints.i LIKE '%333%') OR
        (ints.i LIKE '%44%' AND NOT ints.i LIKE '%444%') OR
        (ints.i LIKE '%55%' AND NOT ints.i LIKE '%555%') OR
        (ints.i LIKE '%66%' AND NOT ints.i LIKE '%666%') OR
        (ints.i LIKE '%77%' AND NOT ints.i LIKE '%777%') OR
        (ints.i LIKE '%88%' AND NOT ints.i LIKE '%888%') OR
        (ints.i LIKE '%99%' AND NOT ints.i LIKE '%999%')
    ) AND (
        SUBSTR(ints.i, 1, 1) <= SUBSTR(ints.i, 2, 1) AND
        SUBSTR(ints.i, 2, 1) <= SUBSTR(ints.i, 3, 1) AND
        SUBSTR(ints.i, 3, 1) <= SUBSTR(ints.i, 4, 1) AND
        SUBSTR(ints.i, 4, 1) <= SUBSTR(ints.i, 5, 1) AND
        SUBSTR(ints.i, 5, 1) <= SUBSTR(ints.i, 6, 1)
    )
;
