# # $dividend = Read-Host "Enter a dividend: "
# # $divisor = Read-Host "Enter a divisor: "
# # try { 
# #     $quotient = $Dividend / $divisor
# #     Write-host "The answer my friend is $quotient" -f green
# # }
# # catch
# # [System.DivideByZeroException] {
# #     Write-host "You can't divide by 0." -f red 
# # }
# # catch {
# #     Write-Host "Something went wrong." -f red 
# # } 

# # $dividend = Read-Host "Enter a dividend: "
# # $divisor = Read-Host "Enter a divisor: "
# # try {
# #     $quotient = $Dividend / $divisor
# #     Write-Host"The answer my friend is $quotient" -f green 
# # }
# # catch { 
# #     Write-Host "You can't divide by 0." -f red 
# # }

# # $dividend = Read-Host "Enter a dividend: " 
# # $divisor = Read-Host "Enter a divisor: " 
# # try {
# #     $quotient = $Dividend / $divisor
# #     Write-host "The answer my friend is $quotient" -f green 
# # }
# # catch 
# # [System.DivideByZeroException] {
# #     Write-host "You can't divide by 0." -f red 
# # }
# # catch {
# #     Write-Host "Something went wrong." -f red $_.Exception.Message 
# # }
# # finally
# # { Write-Host "Thanks for doing math." -f Yellow }

# $dividend = Read-Host "Enter a dividend: "
# $divisor = Read-Host "Enter a divisor: "
# try {
#     $quotient = $Dividend / $divisor
#     Write-host "The answer my friend is $quotient" -f green 
# }
# catch [System.DivideByZeroException] {
#     Write-host "You can't divide by 0." -f red 
# }
# catch {
#     Throw 
# }
# finally {
#     Write-Host "Thanks for doing math." -f Yellow
# }
$color=[System.ConsoleColor]'Red' #Creates a ConsoleColor from a string

[string]$color #Returns the name of the enumeration

[int]$color #Returns the value of the enumeration 

$color.substring(0)