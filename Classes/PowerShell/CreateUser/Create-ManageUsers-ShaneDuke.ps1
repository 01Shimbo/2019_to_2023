# I take pride in this script it was correct on the first try and was one part of the final
# for my OS2 class it was graded on a server that I had no access to so it had to work on any
# Windows Server many students in my class had to submit more than one time to be graded the
# I really enjoy powershell and wanted to do it on my own and only ask the professer one thing 
# which was the "OU=$ou,$domian" part of creating the user

# Create a Script named Manage-Users.ps1 that performs the following functions
# 1. Allow user to input a filename to process.
# a. Create a string parameter named filepath that accepts the name of the xml file to process. Provide an appropriate help message when parameter is not submitted.
# 2. Read the xml file and perform the following tasks.
# 3. Create the users. The xml file will have an arbitrary number of <user> nodes that contain user information.
# a. Create the user account in the organizational unit defined by the <ou> data. Create the OU (off the domain root) if it does not exist.
# b. Set the users name to the value in <account>
# c. Set the other information as listed
# d. Make sure each account is not disabled
# e. Require the user to change their password next time they log in
# f. Add the user to the domain global security group(s) listed in the <memberOf> node. If the group does not exist create it.
# 4. Trap and handle errors as appropriate
# 5. Provide output as appropriate as the script executes.

# takes pramaters for command
param ($filename)
if ($Filename -eq '') {
    write-host  "usage: Create-ManageUsers-ShaneDuke.ps1 <path-to-
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
    #adding a user if manager is blank
    if ($manager -eq ''){ 
        New-ADUser -Name $full -AccountPassword $secpass -ChangePasswordAtLogon $True -Description $description -GivenName $first -Surname $last -Enabled $True -SamAccountName $account -Path "OU=$ou,$domain"
    }
    #add user if they have a manager
     else{
        New-ADUser -Name $full -AccountPassword $secpass -ChangePasswordAtLogon $True -Description $description -GivenName $first -Surname $last -Enabled $True -Manager $manager -SamAccountName $account -Path "OU=$ou,$domian"

   }
    #catch { Write-Host "ERROR ADDING USER: $account" -ForegroundColor Red }
 
    write-host "new user created: $account" -ForegroundColor Green
    write-host "    $account's fullname: $account" -ForegroundColor Green
    Write-Host "    $account's description: $description" -ForegroundColor Green
    Write-Host "    $account's password: $password" -ForegroundColor Green
    if ($manager -ne ''){
    Write-Host "    $account's manager: $manager" -ForegroundColor Green
    }
    Write-Host "    $account's OU: $ou" -ForegroundColor Green
    foreach ($group in $employee.memberOf.group) {
        Add-ADGroupMember -Identity $group -Members $account 
     #   Write-Host catch {"ERROR WITH ADDING $account TO $group" -ForegroundColor Red}
        Write-Host "    $account's Group: $group" -ForegroundColor Green
    }
}