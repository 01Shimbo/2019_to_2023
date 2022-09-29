# gather files and make classes
# create a misc file
# 
$path = "C:$env:HOMEPATH\OneDrive - BYU-Idaho\"
$acl = Get-Acl $path
$aclObj = New-Object System.Security.AccessControl.FileSecurity.FileSystemAccessRule ($path)
$acl | Set-Acl -AclObject $aclObj
# Parameter($path)
$files = Get-ChildItem -Path $path -File
$files = $files.name | Where-Object { $_ -ne 'Shane @ BYU-Idaho.url' -and $_ -ne 'metadata.json' }
if ($files.Count -eq 0) {
    Write-Host "Directory Already Organized" -ForegroundColor Green
}
else {
    $existdir = Get-ChildItem -Directory -Path $path
    $existdir = $existdir.name
    $d = -1
    do {
        $d = $d + 1
        $file = $files[$d]
        foreach ($class in $file) {
            $class = $class.Split(' ')
            $needdir = $class[0]
         
            # Checks if path class exits sets to true or false
            $oldFilePath = $path + $file
            $matchingLocation = Test-Path "$oldFilePath"
            if ($true -eq $matchingLocation) { 
                # Write-Host  "Did I find a match: $path$needdir found" -ForegroundColor Green 
            }
            if ($false -eq $matchingLocation) {
                Write-Host  "Did I find a match: $path$needdir not found" -ForegroundColor Yellow 
                Write-Host  "Directory Created: $needdir" -ForegroundColor Cyan 
                New-Item -Path $path -Name $needdir -ItemType Directory
            
            }
            $newFilePath = $path + $file + '\' + $needdir
            write-host $d "moving file $file to $newFilePath" -ForegroundColor Cyan
            try {
                Move-Item -Path "$oldFilePath" -Destination "$newFilePath" -Force
            }
            catch {
                Write-Host "ERROR MOVING FILE" $file -ForegroundColor Red
            }     
        }
        $aclObj.Dispose()
        Start-Sleep -Seconds 0.5

    }
    while ($d -ne $files.Count)
}
Write-Host "--End of Script--"


                