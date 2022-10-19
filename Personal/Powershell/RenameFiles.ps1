$input = Read-Host "Directory"
$name = Read-Host "Name"
$FileType = Read-Host "Filetype"

$filepath = Get-ChildItem -Path $input #| % { @{Path = $_.fullname } }
$count = 0
foreach ($i in $filepath) {
    $count += 1
    Write-Host "file named to $name-$count.$FileType"
    rename-item -Path $i -NewName "$input\$name-$count.$FileType"
    Write-Host "-----"
}

