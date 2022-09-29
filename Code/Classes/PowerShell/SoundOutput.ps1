# $a = 600, 250,600, 250,600, 250,600, 250,600, 250
# $b = 300, 300,300, 300,300, 300,300, 300,300, 300
# $c = 0 
# while ($c -lt $a.count) {
#     [Console]::Beep($a[$c], $b[$c]) 
#     $c += 1 
# }

Import-Csv .\psfiles\data\RushSongs.txt -Delimiter "`t" | Select-Object song, album, year | export-csv .\psfiles\data\RushSongs.csv