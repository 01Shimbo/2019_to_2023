<#
Program Name : <Network Module>
Date: <2/16/2021>
Author: <Shane Duke>
Corse: CIT361
I, <Shane Duke>, affirm that I wrote this script as original work completed by me.
#>
class MAC {
    [string]$Address
    [string]$ShortName
    [string]$Name 
}
function Get-MACVendor {
    <#
    .Synopsis
    This function takes a database txt file to check first six hex to a vendor list
    #>
    
    param (
        [Parameter(Mandatory)]$DataBasePath,
        [string]$MACAddress
    )
    $Data = Get-Content $DataBasePath | Where-Object { $_ -notmatch "#" } | Where-Object { $_ -ne "" }
    [array]$MacAddress = $MacAddress -split "-"
    write-host $MacAddress
    # select $Data $MacAddress -first 
    $PathTestData = Test-Path -Path $DataBasePath
    if ($PathTestData -eq $true) {
        $Data = Get-Content $DataBasePath
        Write-Host 'data is'$Data[0] 

        $Data = $Data -split '`t'
        Write-Host 'data is'$Data 

        $Data = ForEach-Object { [MAC]$_ }
        Write-Host 'data is'$Data 
        $mac
    }
    else {
        Write-Host "Path for Mac Vendors is invalid!"
    }
}
function get-IPNetwork { 
    param ([ipaddress]$ip, [ipaddress]$sm)
    #takes see the if the ip address is an vaild ip address by c
    if ([ipaddress]::TryParse($ip, [ref][ipaddress]::Loopback) -eq $true) {
        if (ValidSubNetMask($sm) -eq $true) {
            Write-Host "<<<Calculating NetworkID>>>" 
            Write-Host "IP Address:"$ip
            Write-Host "Subnet Mask:"$sm
            $networkID = [ipaddress]($ip.address -band $sm.address)
            Write-Host "The Network ID is:" $networkID -f green
        }
        else {
            write-host "Bad Subnetmask" -f Red
        }
    }
    else {
        write-host "Bad IP Address" -f Red
    }
}
function Test-IPNetork {
    param([ipaddress]$ip1, [ipaddress]$ip2, [ipaddress]$sm)
    if ([ipaddress]::TryParse($ip2, [ref][ipaddress]::Loopback) -eq $true) {
        if ([ipaddress]::TryParse($ip1, [ref][ipaddress]::Loopback) -eq $true) {
            if (ValidSubNetMask($sm) -eq $true) {
                Write-Host "<<<Calculating if two devices share a network>>>"
                Write-Host "IP Address 1:"$ip1
                Write-Host "IP Address 2:"$ip2
                

                $networkID1 = [ipaddress]($ip1.address -band $sm.address)
                $networkID2 = [ipaddress]($ip2.address -band $sm.address)
                
                if ($networkID1 -eq $networkID2) {
                    $TheNetID = $networkID1;
                    Write-Host "The ip addresses are on the same network: $TheNetID" -f green
                }
                else {
                    Write-Host "addresses are not on the same network" -f red
                    write-host "first network ID: $networkID1"
                    write-host "secound network ID: $networkID2" 
                }
            }
            else {
                write-host "Bad Subnetmask" -f Red
            }
        }
        else {
            write-host "Bad IP Address" -f Red
        }
    }
    else {
        write-host "Bad IP Address" -f Red
    }
}