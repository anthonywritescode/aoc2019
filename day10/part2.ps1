if ($args.Length -ne 1) {
    Write-Error "usage: FILENAME"
    Exit 1
}

function Get-GCD ($x, $y) {
    if ($y -eq 0) { $x } else { Get-GCD $y ($x%$y) }
}

function Get-Slope-Key($x, $y) {
    if ($y -lt 0 -and $x -eq 0) {
        10000
    } elseif ($y -lt 0 -and $x -gt 0) {
        9000 + [math]::abs($y / $x)
    } elseif ($x -gt 0 -and $y -eq 0) {
        8000
    } elseif ($x -gt 0 -and $y -gt 0) {
        7000 + [math]::abs($x / $y)
    } elseif ($y -gt 0 -and $x -eq 0) {
        6000
    } elseif ($y -gt 0 -and $x -lt 0) {
        5000 + $y / $x
    } elseif ($y -eq 0 -and $x -lt 0) {
        4000
    } else {
        3000 + [math]::abs($x / $y)
    }
}


$coords = @{}
$lines = Get-Content $args[0]
for ($y=0; $y -lt $lines.Length; $y++) {
    for ($x=0; $x -lt $lines[$y].Length; $x++) {
        if ($lines[$y][$x] -eq '#') {
            if (!$coords.Contains($x)) {
                $coords[$x] = @{}
            }
            $coords[$x][$y] = 1
        }
    }
}

$coord_x = 26
$coord_y = 28

$slopes=@{}
for ($x_i = 0; $x_i -lt $x; $x_i++) {
    for ($y_i = 0; $y_i -lt $y; $y_i++) {
        if ($x_i -eq $coord_x -and $y_i -eq $coord_y) {
            continue
        }
        $x_diff = $x_i - $coord_x
        if ($x_diff -ge 0) {
            $x_sign = 1
        } else {
            $x_sign = -1
        }
        $y_diff = $y_i - $coord_y
        if ($y_diff -ge 0) {
            $y_sign = 1
        } else {
            $y_sign = -1
        }
        if ($x_diff -eq 0) {
            $y_diff = $y_sign * 1
        }
        if ($y_diff -eq 0) {
            $x_diff = $x_sign * 1
        }
        $gcd = [math]::abs($(Get-GCD $x_diff $y_diff))

        $x_diff /= $gcd
        $y_diff /= $gcd

        if (!$slopes.Contains($x_diff)) {
            $slopes[$x_diff] = @{}
        }
        $slopes[$x_diff][$y_diff] = 1
    }
}

$slopes_sorted_k = @()
$slopes_sorted = @()

foreach ($key_x in $slopes.Keys) {
    foreach ($key_y in $slopes[$key_x].Keys) {
        $slope_key = Get-Slope-Key $key_x $key_y
        for ($i = 0; $i -lt $slopes_sorted_k.Length; $i++) {
            if ($slopes_sorted_k[$i] -gt $slope_key) {
                break
            }
        }
        if ($i -eq 0) {
            $slopes_sorted_k = @($slope_key) + $slopes_sorted_k
            $slopes_sorted = , @(@($key_x,$key_y)) + $slopes_sorted
        } else {
            $slopes_sorted_k = $slopes_sorted_k[0..$($i-1)] + $slope_key + $slopes_sorted_k[$i..$slopes_sorted_k.Length]
            $slopes_sorted = $slopes_sorted[0..$($i-1)] + , @(@($key_x,$key_y)) + $slopes_sorted[$i..$slopes_sorted.Length]
        }
    }
}

$count = 0
while ($true) {
    for ($i = $slopes_sorted.Length - 1; $i -ge 0; $i--) {
        $slope = $slopes_sorted[$i]
        $new_x = $coord_x + $slope[0]
        $new_y = $coord_y + $slope[1]

        while (
            0 -le $new_x -and $new_x -lt $x -and
            0 -le $new_y -and $new_y -lt $y
        ) {
            if ($coords.ContainsKey($new_x) -and $coords[$new_x].ContainsKey($new_y)) {
                $count++
                $coords[$new_x].Remove($new_y)
                if ($count -eq 200) {
                    100 * $new_x + $new_y
                    Exit 0
                }
                break
            }
            $new_x += $slope[0]
            $new_y += $slope[1]
        }
    }
}
