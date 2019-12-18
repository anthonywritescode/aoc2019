<?php

if (count($argv) !== 2) {
    echo 'usage: ' . $argv[0] . " FILENAME\n";
}

$prog = json_decode('[' . file_get_contents($argv[1]) . ']', true);
$prog[0] = 2;

$rb = 0;
$pc = 0;

$x = 0;
$y = 0;
$bot_x = 0;
$bot_y = 0;
$grid = array(array());

$run_once = FALSE;
$path = array();
$out_prog = '';

function add_coord($p1, $p2) {
    return [$p1[0] + $p2[0], $p1[1] + $p2[1]];
}

function print_grid($grid) {
    foreach ($grid as $y_coord => $row) {
        foreach ($row as $x_coord => $s) {
            echo $s;
        }
        echo "\n";
    }
}

function calculate_path($grid, $pos) {
    assert($grid[$pos[1]][$pos[0]] == '^');
    $DIRECTIONS = [[0, -1], [1, 0], [0, 1], [-1, 0]];
    $direction = $DIRECTIONS[0];
    $ret = array();
    $n = 0;

    while (TRUE) {
        $pos_idx = array_search($direction, $DIRECTIONS);
        $right_dir = $DIRECTIONS[($pos_idx + 1) % 4];
        $left_dir = $DIRECTIONS[($pos_idx + 3) % 4];
        $next_up = add_coord($pos, $direction);
        $next_right = add_coord($pos, $right_dir);
        $next_left = add_coord($pos, $left_dir);

        if (in_array(($grid[$next_up[1]][$next_up[0]] ?? ''), ['#', 'X'])) {
            $n += 1;
            $pos = $next_up;
            $grid[$pos[1]][$pos[0]] = 'X';
        } else if (($grid[$next_right[1]][$next_right[0]] ?? '') === '#') {
            array_push($ret, strval($n), 'R');
            $n = 0;
            $direction = $right_dir;
        } else if (($grid[$next_left[1]][$next_left[0]] ?? '') === '#') {
            array_push($ret, strval($n), 'L');
            $n = 0;
            $direction = $left_dir;
        } else {
            array_push($ret, strval($n));
            return array_slice($ret, 1);
        }
    }
};

function calculate_prog($path) {

}

function param($instr, $n, $prog, $rb, $pc) {
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

function store($instr, $n, $prog, $rb, $pc) {
    $mode = intdiv($instr, pow(10, ($n + 1))) % 10;
    switch ($mode) {
        case 0:
            return $prog[$pc + $n] ?? 0;
        case 2:
            return $rb + $prog[$pc + $n] ?? 0;
        default:
            assert("unreachable");
    }
}

while (TRUE) {
    $instr = $prog[$pc];
    $opc = $instr % 100;
    switch ($opc) {
        case 99:
            break 2;
        case 1:
            $prog[store($instr, 3, $prog, $rb, $pc)] = param($instr, 1, $prog, $rb, $pc) + param($instr, 2, $prog, $rb, $pc);
            $pc += 4;
            break;
        case 2:
            $prog[store($instr, 3, $prog, $rb, $pc)] = param($instr, 1, $prog, $rb, $pc) * param($instr, 2, $prog, $rb, $pc);
            $pc += 4;
            break;
        case 3:
            if (!$run_once) {
                while (empty($grid[count($grid) - 1])) {
                    unset($grid[count($grid) - 1]);
                }
                $path = calculate_path($grid, [$bot_x, $bot_y]);
                $out_prog = calculate_prog($path);
                echo $out_prog . "\n";
                exit(1);
                $run_once = TRUE;
            }
            $prog[store($instr, 1, $prog, $rb, $pc)] = ord($out_prog[$idx]);
            $idx += 1;
            $pc += 2;
            break;
        case 4:
            $s = chr(param($instr, 1, $prog, $rb, $pc));
            if ($s === "\n") {
                $x = 0;
                $y += 1;
                $grid[$y] = array();
            } else if (in_array($s, ['.', '#', '^'])) {
                if ($s === '^') {
                    $bot_x = $x;
                    $bot_y = $y;
                }
                $grid[$y][$x] = $s;
                $x += 1;
            }
            echo $s;
            $pc += 2;
            break;
        case 5:
            if (param($instr, 1, $prog, $rb, $pc) !== 0) {
                $pc = param($instr, 2, $prog, $rb, $pc);
            } else {
                $pc += 3;
            }
            break;
        case 6:
            if (param($instr, 1, $prog, $rb, $pc) === 0) {
                $pc = param($instr, 2, $prog, $rb, $pc);
            } else {
                $pc += 3;
            }
            break;
        case 7:
            if (param($instr, 1, $prog, $rb, $pc) < param($instr, 2, $prog, $rb, $pc)) {
                $prog[store($instr, 3, $prog, $rb, $pc)] = 1;
            } else {
                $prog[store($instr, 3, $prog, $rb, $pc)] = 0;
            }
            $pc += 4;
            break;
        case 8:
            if (param($instr, 1, $prog, $rb, $pc) === param($instr, 2, $prog, $rb, $pc)) {
                $prog[store($instr, 3, $prog, $rb, $pc)] = 1;
            } else {
                $prog[store($instr, 3, $prog, $rb, $pc)] = 0;
            }
            $pc += 4;
            break;
        case 9:
            $rb += param($instr, 1, $prog, $rb, $pc);
            $pc += 2;
        default:
            assert('unreachable');
    }
}
