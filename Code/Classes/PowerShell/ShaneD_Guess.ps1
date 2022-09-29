clear-host
do {
    $Numbers = 1..100
    $Andswer = $Numbers | get-random
    do {
        $player = Read-Host "Enter Number Between 1-100"; 
        $loopindex++;
        if ($player -gt $Andswer) {Write-Host "Lower" -f Yellow};
        if ($player -lt $Andswer) {Write-Host "Higher" -f Yellow}
    }
    until(
        $player -eq $Andswer
    )
    clear-host
    write-host "CORRECT!" -f green
    Write-Host "player guess count:" $loopindex
    $loopindex = $null
    $game = Read-Host @'
[P] play again
[X] exit
What would you like to do?

'@
    switch ($game) {
        "P" { $game = "not over" }
        "X" { $game = "over" }
    }
}
until($game -eq "over")

