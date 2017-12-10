function New-Program ($name, $weight, $children) {
    $program = New-Object PSObject

    $program | Add-Member -Type NoteProperty -Name Name -Value $name
    $program | Add-Member -Type NoteProperty -Name Weight -Value $weight
    $program | Add-Member -Type NoteProperty -Name Children -Value $children

    $program
}

filter Import-Programs {
    ($_ -match "(?<name>\w+)\s\((?<weight>\d+)\)( -> (?<children>[\w, ]+))?") >$null
    New-Program -Name $matches.name -Weight $matches.weight -Children $($matches.children -split ', ')
}

filter IsAChild {if ($Children.contains($_.Name)) {$_}}

filter NotAChild {if (-not($Children.contains($_.Name))) {$_}}

$programs = Get-Content ./07input.txt | Import-Programs

# Only programs with children can be at the bottom
$parents = $programs | ? Children -gt 0

$children = $programs | % Children | Sort-Object -Unique

$programs | ?{if (-not($children.contains($_.Name))){$_}}

# Part One answer: qibuqqg
