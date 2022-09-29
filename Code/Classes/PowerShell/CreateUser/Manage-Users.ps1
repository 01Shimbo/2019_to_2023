# takes pramaters for command
param ($filename)
if ($Filename -eq '') {
    write-host  "usage: Manage-Users.ps1 <path-to-
    xml-file>" -ForegroundColor red
    '_' * 80
}
[xml]$xml = (Get-Content $filename) 
# list of existing groups

#loop for each account (with verbal output)
foreach ($employee in $xml.root.user) {
    # gather the users information 
    $account = $employee.account
    $first = $employee.firstname
    $last = $employee.lastname
    $full = $first + ' ' + $last
    $description = $employee.description
    $password = $employee.password
    $secpass = (convertTo-secureString -asplaintext "$password" -force)
    $manager = $employee.manager
    $ou = $employee.ou
    $group = $employee.memberOf.group
    $domain = (Get-ADDomain).DistinguishedName
    # create account with approprate information  
    
    # # *check if OU exist than create OU
    if (Get-ADOrganizationalUnit -Filter "Name -eq '$ou'") { 
        $OUCheck = "Exist"
    }
    else {
        $OUCheck = "NO"
        Write-Host "The OU $ou does not exist" -ForegroundColor Yellow
    }
    if ("NO" -eq $OUCheck) {
        # create new OU
        New-ADOrganizationalUnit -Name "$ou"  
        Write-Host "New OU created: $ou" -ForegroundColor Cyan
    }
    else {
        Write-Host "The OU $ou exist" -ForegroundColor Green
    }
    # *check if group exist than create group
    foreach ($group in $employee.memberOf.group) {
        if (Get-ADGroup -Filter "Name -eq '$group'") { 
            $GroupCheck = "Exist" 
            Write-Host "The Group $group exists" -ForegroundColor Green
        }
        else {
            $GroupCheck = "NO"
            Write-Host "The Group $group does not exists" -ForegroundColor Yellow
        }
        if ("NO" -eq $GroupCheck) {
            # create new group
            New-ADGroup -Name "$group" -GroupScope Global
            Write-Host "New group created: $group" -ForegroundColor Cyan
        }
    }
    try {
        #adding a user if manager is blank
        if ($manager -eq '') { 
            New-ADUser -Name $full -AccountPassword $secpass -ChangePasswordAtLogon $True -Description $description -GivenName $first -Surname $last -Enabled $True -SamAccountName $account -Path "OU=$ou,$domain"
        }
        #add user if they have a manager
        else {
            New-ADUser -Name $full -AccountPassword $secpass -ChangePasswordAtLogon $True -Description $description -GivenName $first -Surname $last -Enabled $True -Manager $manager -SamAccountName $account -Path "OU=$ou,$domain"
        }
    }
    catch { Write-Host "ERROR ADDING USER: $account" -ForegroundColor Red }
 
    write-host "new user created: $account" -ForegroundColor Green
    write-host "    $account's fullname: $account" -ForegroundColor Green
    Write-Host "    $account's description: $description" -ForegroundColor Green
    Write-Host "    $account's password: $password" -ForegroundColor Green
    if ($manager -ne '') {
        Write-Host "    $account's manager: $manager" -ForegroundColor Green
    }
    Write-Host "    $account's OU: $ou" -ForegroundColor Green
    foreach ($group in $employee.memberOf.group) {
        try {
            Add-ADGroupMember -Identity $group -Members $account
            Write-Host "    $account's Group: $group" -ForegroundColor Green
        }
        catch { Write-Host "ERROR WITH ADDING $account TO $group" -ForegroundColor Red }
    }
}
Write-Host "--end of script-- "
