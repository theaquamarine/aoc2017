$puzzleinput = Get-Content ./05input.txt
$currentinstruction = 0
$stepcount = 0

while ($currentinstruction -lt $puzzleinput.length) {
    $offset = $puzzleinput[$currentinstruction]

    if ($offset -ge 3) {
        ([int]$puzzleinput[$currentinstruction])--
    } else {
        ([int]$puzzleinput[$currentinstruction])++
    }

    $currentinstruction += $offset

    $stepcount++
}

$stepcount

# Part Two answer: 21841249
