if ($args.Length -ne 1) {
    Write-Error "usage: FILENAME"
    Exit 1
}

function Get-GCD ($x, $y) {
  if ($y -eq 0) { $x } else { Get-GCD $y ($x%$y) }
}

$coords = @()
$lines = Get-Content $args[0]
for ($y=0; $y -lt $lines.Length; $y++) {
    for ($x=0; $x -lt $lines[$y].Length; $x++) {
        if ($lines[$y][$x] -eq '#') {
            $coords += , @($x,$y)
        }
    }
}

$counts = @()
foreach ($coord in $coords) {
    $count = 0
    foreach ($other_coord in $coords) {
        if ("$coord" -eq "$other_coord") {
            continue
        }
        $x_diff = $other_coord[0] - $coord[0]
        if ($x_diff -ge 0) {
            $x_sign = 1
        } else {
            $x_sign = -1
        }
        $y_diff = $other_coord[1] - $coord[1]
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

        $broken = $false
        $new_x = $coord[0] + $x_diff
        $new_y = $coord[1] + $y_diff
        while ($new_x -ne $other_coord[0] -or $new_y -ne $other_coord[1]) {
            $found = $false
            foreach ($other_coord2 in $coords) {
                if ($new_x -eq $other_coord2[0] -and $new_y -eq $other_coord2[1]) {
                    $found = $true
                    break
                }
            }
            if ($found) {
                $broken = $true
                break
            }
            $new_x += $x_diff
            $new_y += $y_diff
        }
        if (!$broken) {
            $count++
        }
    }
    $counts += , @($count,$coord)
}

$max = 0
foreach ($count in $counts) {
    $max = [math]::max($max, $count[0])
}

"$max"
