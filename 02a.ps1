param (
    [Parameter(Mandatory=$true)]
    [string]$puzzleinput
    )

$puzzleinput -split(' ')| Measure-Object -Minimum -Maximum | select @{Name="Range"; Expression={$_.Maximum - $_.Minimum}}
