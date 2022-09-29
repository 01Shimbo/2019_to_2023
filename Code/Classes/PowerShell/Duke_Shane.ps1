$A = Get-ChildItem .\psfiles\data\gems.xml
write-host "gems.xml length:" $A.Length
$B = Get-FileHash .\psfiles\data\gems.xml -Algorithm MD5
write-host "gems.xml MD5 hash:" $B.Hash
$C = [xml](Get-Content .\psfiles\data\gems.xml)
write-host "gems in gems.xml:" $C.gems.gem.gid.Count
# foreach ($hardness in $C.gems.gem.hardness) {  
#     if ($hardness -gt 7) {
#         Export-Csv -path .\Duke_Shane-hardgems.csv -InputObject $hardness
#     }
# }
Import-Csv .\gems.csv | Where-Object {$_.hardness -gt 7 } | Export-csv -path .\Duke_Shane-hardness -InputObject $hardness
$doi = Get-Content -path .\psfiles\files\DOI.txt
$doilist = $doi -split " " | Where-Object { $_ -ne "" }
write-host "doi.txt word count:" $doilist.Count
$uniqulist = $doilist | Sort-Object | Get-Unique
write-host "doi.txt unique:" $uniqulist.Count
Set-Content  -path .\Duke_Shane-words.txt -Value $uniqulist
