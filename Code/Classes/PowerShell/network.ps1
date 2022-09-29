<#
Program Name : <Network Functions>
Date: <2/11/2021>
Author: <Shane Duke>
Corse: CIT361
I, <Shane Duke>, affirm that I wrote this script as original work completed by me.
#>
#refernces
# https://docs.microsoft.com/en-us/dotnet/api/system.net.ipaddress?view=net-5.0
# tryparse convers sting into int.32
# https://docs.microsoft.com/en-us/dotnet/api/system.int32.tryparse?view=net-5.0
# https://docs.microsoft.com/en-us/dotnet/api/system.net.ipaddress.loopback?view=net-5.0

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
function ValidSubNetMask($sm) {
    $sms = '0.0.0.0', '128.0.0.0', '192.0.0.0', '224.0.0.0', '240.0.0.0', '248.0.0.0', '252.0.0.0', '254.0.0.0', '255.0.0.0', '255.128.0.0', '255.192.0.0', '255.224.0.0', '255.240.0.0', '255.248.0.0', '255.252.0.0', '255.254.0.0', '255.255.0.0', '255.255.128.0', '255.255.192.0', '255.255.224.0', '255.255.240.0', '255.255.248.0', '255.255.252.0', '255.255.254.0', '255.255.255.0', '255.255.255.128', '255.255.255.192', '255.255.255.224', '255.255.255.240', '255.255.255.248', '255.255.255.252', '255.255.255.254', '255.255.255.255'
    if ($sm -in $sms) {
        return $true
    }
    else {
        return $false
    }
    Write-host $sm
    Write-host $sms.GetType()
}

