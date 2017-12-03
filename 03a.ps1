param ([Parameter(Mandatory=$true)]$puzzleinput)

function Get-RingNumber {
    param ([Parameter(Mandatory=$true)][int]$square)

    # Ring number is the radius of the ring
    $a = [math]::ceiling([math]::sqrt($square))

    $a = $a - ($a%2)

    $a/2
}

function Get-HighestNumberOnRing {
    param ([Parameter(Mandatory=$true)][int]$ring)

    # Highest number on a ring is the square of the ring's diameter, ie double the ring number
    [math]::pow((2*$ring + 1),2)
}

function Get-MidpointsofRing {
    param ([Parameter(Mandatory=$true)][int]$ring)

    $highest = Get-HighestNumberOnRing $ring

    @(($highest - 1*$ring),
    ($highest - 3*$ring),
    ($highest - 5*$ring),
    ($highest - 7*$ring))
}

# Ring number is the radius of the ring (distance from access port to the midpoint of the ring's sides)
$ring = Get-RingNumber $puzzleinput
$distanceToMidpoint = (Get-MidpointsofRing $ring | %{[math]::abs($_ - $puzzleinput)} | Measure-Object -Minimum).Minimum

$ring + $distanceToMidpoint

# Part One input: 265549
# Part One answer: 438
