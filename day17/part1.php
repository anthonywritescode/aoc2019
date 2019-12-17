<?php

if (count($argv) !== 2) {
    echo 'usage: ' . $argv[0] . " FILENAME\n";
}

$prog = json_decode('[' . file_get_contents($argv[1]) . ']', true);

$rb = 0;
$pc = 0;

$x = 0;
$y = 0;
$grid = array(array());

$param = function ($instr, $n, $prog, $rb, $pc) {
    $mode = intdiv($instr, pow(10, ($n + 1))) % 10;
    switch ($mode) {
        case 0:
            return $prog[$prog[$pc + $n] ?? 0] ?? 0;
        case 1:
            return $prog[$pc + $n] ?? 0;
        case 2:
            return $prog[$rb + $prog[$pc + $n] ?? 0] ?? 0;
        default:
            assert("unreachable");
    }
};

$store = function ($instr, $n, $prog, $rb, $pc) {
    $mode = intdiv($instr, pow(10, ($n + 1))) % 10;
    switch ($mode) {
        case 0:
            return $prog[$pc + $n] ?? 0;
        case 2:
            return $rb + $prog[$pc + $n] ?? 0;
        default:
            assert("unreachable");
    }
};

while (TRUE) {
    $instr = $prog[$pc];
    $opc = $instr % 100;
    switch ($opc) {
        case 99:
            break 2;
        case 1:
            $prog[$store($instr, 3, $prog, $rb, $pc)] = $param($instr, 1, $prog, $rb, $pc) + $param($instr, 2, $prog, $rb, $pc);
            $pc += 4;
            break;
        case 2:
            $prog[$store($instr, 3, $prog, $rb, $pc)] = $param($instr, 1, $prog, $rb, $pc) * $param($instr, 2, $prog, $rb, $pc);
            $pc += 4;
            break;
        case 3:
            // TODO input
            $prog[$store($instr, 1, $prog, $rb, $pc)] = 2;
            $pc += 2;
            break;
        case 4:
            // TODO output
            $s = chr($param($instr, 1, $prog, $rb, $pc));
            if ($s === "\n") {
                $x = 0;
                $y += 1;
                $grid[$y] = array();
            } else {
                $grid[$y][$x] = $s;
                $x += 1;
            }
            echo $s;
            $pc += 2;
            break;
        case 5:
            if ($param($instr, 1, $prog, $rb, $pc) !== 0) {
                $pc = $param($instr, 2, $prog, $rb, $pc);
            } else {
                $pc += 3;
            }
            break;
        case 6:
            if ($param($instr, 1, $prog, $rb, $pc) === 0) {
                $pc = $param($instr, 2, $prog, $rb, $pc);
            } else {
                $pc += 3;
            }
            break;
        case 7:
            if ($param($instr, 1, $prog, $rb, $pc) < $param($instr, 2, $prog, $rb, $pc)) {
                $prog[$store($instr, 3, $prog, $rb, $pc)] = 1;
            } else {
                $prog[$store($instr, 3, $prog, $rb, $pc)] = 0;
            }
            $pc += 4;
            break;
        case 8:
            if ($param($instr, 1, $prog, $rb, $pc) === $param($instr, 2, $prog, $rb, $pc)) {
                $prog[$store($instr, 3, $prog, $rb, $pc)] = 1;
            } else {
                $prog[$store($instr, 3, $prog, $rb, $pc)] = 0;
            }
            $pc += 4;
            break;
        case 9:
            $rb += $param($instr, 1, $prog, $rb, $pc);
            $pc += 2;
        default:
            assert('unreachable');
    }
}

// we add an extra empty array at the end
unset($grid[count($grid) - 1]);
// it prints an extra newline at the end
unset($grid[count($grid) - 1]);

$is_intersection = function($grid, $y_coord, $x_coord) {
    return (
        $grid[$y_coord][$x_coord] === '#' &&
        $y_coord > 0 &&
        $x_coord > 0 &&
        $y_coord < count($grid) - 1 &&
        $x_coord < count($grid[0]) - 1 &&
        $grid[$y_coord + 1][$x_coord] === '#' &&
        $grid[$y_coord - 1][$x_coord] === '#' &&
        $grid[$y_coord][$x_coord + 1] === '#' &&
        $grid[$y_coord][$x_coord - 1] === '#'
    );
};

$ret = 0;
foreach ($grid as $y_coord => $row) {
    foreach ($row as $x_coord => $s) {
        if ($is_intersection($grid, $y_coord, $x_coord)) {
            $ret += $y_coord * $x_coord;
        }
    }
}
echo $ret . "\n";
