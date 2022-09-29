$c = Get-Content C:\Users\Shane\Documents\psfiles\data/colors.txt | Sort-Object
$o = @()
foreach ($item in $c) {
    if ($item -match "blue") {
        Write-Host $item 
        $o += $item

    }
}
Add-Content -Path colorsblue.txt -Value $o #the file is put in the practiceCode/Powershell directory

Get-Content C:\Users\Shane\Documents\psfiles\data\colors.txt | Where-Object {$_ -match 'blue'} | sort-object | Set-Content blue.txt