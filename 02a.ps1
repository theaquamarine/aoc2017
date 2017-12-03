param (
    [Parameter(Mandatory=$true)]
    [string]$puzzleinput
    )

function Get-Range {
    param (
        [Parameter(Mandatory=$true,ValueFromPipeline)]
        [string]$line
        )

    -split $line| Measure-Object -Minimum -Maximum | %{$_.Maximum - $_.Minimum}
}

$puzzleinput -split '\n' | %{Get-Range $_} | Measure-Object -Sum

# Part One answer: 45158
