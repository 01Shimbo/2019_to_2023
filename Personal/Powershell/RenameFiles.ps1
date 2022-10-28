$dir = Read-Host "Directory"
$name = Read-Host "Name"
$FileType = Read-Host "Filetype"

$filepath = Get-ChildItem -Path $dir #| % { @{Path = $_.fullname } }
$count = 0
foreach ($i in $filepath) {
    $count += 1
    Write-Host "file named to $name-$count.$FileType"
    rename-item -Path $i -NewName "$dir\$name-$count.$FileType"
    Write-Host "--end of script-- "
}

