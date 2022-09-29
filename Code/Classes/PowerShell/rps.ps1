<#
Program Name : <Want to play a game >
Date: <1/23/2021>
Author: <Shane Duke>
Corse: CIT361
I, <Shane Duke>, affirm that I wrote this script as original work completed by me.
#>

$p = Read-Host @'
What would you like to do?
[R] Rock
[P] Paper
[S] Scissors
'@
switch ($p) {
    'R' { $p = 'playRock' }
    'P' { $p = 'playPaper' }
    'S' { $p = 'playScissors' }
}
$ai = 'rock','paper','sissors'| get-random
Write-Host "AI:" $ai
switch ($p) { 
    'playRock' {
        if ($ai -eq 'rock') { $result = "you tied" }
        if ($ai -eq 'paper') { $result = "you lost" }
        if ($ai -eq 'sissors') { $result = "you won" }
    }
    'playPaper' {
       
        if ($ai -eq 'rock') { $result = "you won" }
        if ($ai -eq 'paper') { $result = "you tied" }
        if ($ai -eq 'sissors') { $result = "you lost" }
    }
    'playScissors' {
       
        if ($ai -eq 'rock') { $result = "you lost" }
        if ($ai -eq 'paper') { $result = "you won" }
        if ($ai -eq 'sissors') { $result = "you won" }
    }
}

Write-Host $result
# $aiScore = 0
# $playerScore = 0
# switch ($result) {
#     "you won" { $playerScore + 1 }
#     "you lost" {$aiScore + 1}
# }
# Write-Host 'player score: ' $playerScore
# Write-Host 'AI score: ' $aiScore