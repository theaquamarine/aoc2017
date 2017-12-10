# param ([Parameter(Mandatory=$true)]$puzzleinput)


function Test-ValidPassword {
    param ([Parameter(Mandatory=$true, ValueFromPipeline=$true)] [string]$password)

    if (($password -split ' ' | Group-Object)| ?{$_.Count -gt 1}) {$false} else {$true}
}

Get-Content ./04input.txt | ?{Test-ValidPassword $_} | Measure-Object | Select-Object -ExpandProperty Count

# Part One answer: 466
