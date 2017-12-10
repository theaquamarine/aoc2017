$puzzleinput = Get-Content ./05input.txt
$currentinstruction = 0
$stepcount = 0

while ($currentinstruction -lt $puzzleinput.length) {
    $currentinstruction += ([int]$puzzleinput[$currentinstruction])++
    # $puzzleinput -join ','
    # "cur = $currentinstruction"
    # "dst = $destination"

    $stepcount++
}

$stepcount

# Part One answer: 326618
