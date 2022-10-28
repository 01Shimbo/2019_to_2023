param($path)
# $path = "$env:HOMEPATH" + "\*"
$files = Get-ChildItem -Path $path -Recurse | ForEach-Object { $_.FullName } 
foreach ($filepath in $files) {
    $file = $filepath.Split('\')
    $filepath
    $filepath.GetType()

    $file = $file[-1]

    #check for invalid file characters 

    $invalidChar = [IO.Path]::GetinvalidFileNameChars() + '[' + ']'
    $invalidChar | ForEach-Object { $file = $file.Replace($_, ' ').Trim() }
    Write-host "Rename will start" -ForegroundColor Yellow
    Write-Host "Rename-Item -path $filepath -NewName $file" -ForegroundColor Green
    Rename-Item -path $filepath -NewName $file
     
}
Write-Host "--end of script-- "

