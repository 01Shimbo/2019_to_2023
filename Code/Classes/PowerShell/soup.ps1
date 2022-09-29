# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comment_based_help?view=powershell-7.1
function Get-Soup {
    <#
.Synopsis
This Function gets the user input of the soup, size and quanity of soup the user wants, don't for get to say please

.Description
This Function gets the user input of the soup, size and quanity of soup the user wants. If the pramameters are not meet the user does not get soup. If the user does not say please the user does not get soup. If the user does not put the parameters in the proper order the user does not get soup.

.Example
get-soup tomato cup 3
No tomato soup of you!
.Example
get-soup potato pot 2 please
2 pots of potato soup for you.
#>
    [Alias('Soup')]
    param (
        [parameter(Mandatory = $true)]$soup,
        [ValidateSet('Cup', 'Bowl', 'Pot')]$size,
        [ValidateRange(1, 5)]$Quantity = 1,
        $Please
    )
    if ($Please -eq 'please') {
        "$Quantity $size$(if($quantity -gt 1){'s'}) of $soup soup for you." 
    }
    else {
        "No $soup soup of you!"
    }
}