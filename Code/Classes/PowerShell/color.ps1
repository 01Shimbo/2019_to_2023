<#
Program Name : <color>
Date: <2/6/2021>
Author: <Shane Duke>
Corse: CIT361
I, <Shane Duke>, affirm that I wrote this script as original work completed by me.
#>
do {
    $SystemColors = [System.Enum]::getvalues([System.ConsoleColor]) #Returns an array of all the possible ConsoleColor Values
    $AIcolor = $SystemColors | get-random
    # $color = [System.ConsoleColor]$AIcolor #Creates a ConsoleColor from a string
    #[string]$color #Returns the name of the enumeration
    #[int]$color #Returns the value of the enumeration
    
    do {
        $player = Read-Host "Enter Color"; $loopindex++
    }
    until(($player -eq $AIcolor) -or (write-host "incorrect! try again" -f Yellow))
    if ($player -eq $AIcolor) { Write-Host "CORRECT!" $AIcolor -f $AIcolor "is my favorite color" }
    Write-Host "player guess count:" $loopindex
    $loopindex = 0

    $game = Read-Host @'
What would you like to do?
[P] play again
[X] exit
'@
    switch ($game) {
        'P' { $game = "not over" }
        'X' { $game = 'over' }
    }
}
until($game -eq "over")



