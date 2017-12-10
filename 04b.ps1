# param ([Parameter(Mandatory=$true)]$puzzleinput)

filter Sort-String {
    ($_.ToCharArray() | Sort-Object) -join ''
}

filter Test-ValidPassword {
    if (-not( ($_ -split ' ' | Sort-String | Group-Object)| ? Count -gt 1)) {$_}
}

Get-Content ./04input.txt | Test-ValidPassword | Measure-Object | Select-Object -ExpandProperty Count

# Part Two answer: 251
