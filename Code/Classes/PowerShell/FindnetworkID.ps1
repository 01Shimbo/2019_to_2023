$run = Read-Host "Would you like to calculate the Network Address? (Y for yes, N for no)"
if ($run -eq 'Y') {
    $ipAddress = Read-Host "Please enter your IP Address"
    $subnetMask = Read-Host "Please enter your Subnet Mask"
}
$ip = [ipaddress]$ipaddress
$subnet = [ipaddress]$subnetmask
$netid = [ipaddress]($ip.address -band $subnet.address)
write-host "Network id: $($netid.ipaddresstostring)"