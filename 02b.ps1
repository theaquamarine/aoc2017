param (
    [Parameter(Mandatory=$true)]
    [string]$puzzleinput
    )

filter Test-EvenlyDivisible {
    param (
        [Parameter(Mandatory=$true)][int]$a,
        [Parameter(Mandatory=$true)][int]$b
        )

    ($a/$b)%1 -eq 0
}

function Find-EvenlyDivisibleValues {
    param (
        [Parameter(Mandatory=$true,ValueFromPipeline)]
        [string]$line
        )

    $lines = -split $line

    for ($i = 0; $i -lt $lines.length; $i++) {
        for ($j = 0; $j -lt $lines.length; $j++) {
            if ($i -eq $j) {continue}
            elseif (Test-EvenlyDivisible $lines[$i] $lines[$j]) {
                $lines[$i]/$lines[$j]
            }
        }
    }
}

$puzzleinput -split '\n' | %{Find-EvenlyDivisibleValues $_} | Measure-Object -Sum

# Part Two answer: 294
