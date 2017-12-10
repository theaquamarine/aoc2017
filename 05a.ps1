$puzzleinput = Get-Content ./05input.txt
$currentinstruction = 0
$stepcount = 0

while ($true) {
    $destination = $currentinstruction + $puzzleinput[$currentinstruction]
    # $puzzleinput -join ','
    # "cur = $currentinstruction"
    # "dst = $destination"

    ([int]$puzzleinput[$currentinstruction])++
    $stepcount++

    if ($destination -ge $puzzleinput.length) {break}
    else {$currentinstruction = $destination}
}

$stepcount

# Part One answer: 326618
