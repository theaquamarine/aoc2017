param (
    [Parameter(Mandatory=$true)]
    [string]$puzzleinput
    )

$acc = 0

for ($i=0; $i -lt $puzzleinput.length; $i++) {
    $current = $puzzleinput[$i]
    $next = $puzzleinput[($i+1) % $puzzleinput.length]

    if ($current -eq $next) {
        # $current is a char, so cast to string first
        $acc += [string]$current
    }
}

$acc
