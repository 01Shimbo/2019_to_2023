try {
    param($location, $desination) 
}
catch {
    Write-Host "enter the location of the file and the destination of the file" -ForegroundColor red 
    Write-Host "example: $env:HOMEPATH\downloads\rawData.txt $env:HOMEPATH\downloads\WhitelistWallets.txt " -ForegroundColor red 
}
$wallets = Get-Content "$location"
$i = 0
foreach ( $wallet in $wallets) {
    $i += 1
    if ($i -le 420) {
        Add-Content "$desination" -Value $wallet
    }
}

