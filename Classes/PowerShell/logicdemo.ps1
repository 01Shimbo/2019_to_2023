function Get-Truthtable {
    param (
        [ValidateSet("And","Or", "Xor")]
        [Parameter(Mandatory=$true)]
        $Operator
    )
    Write-Host "Truth table for $operator"
    Write-Host "True $operator True = $(invoke-expression " `$true -$operator `$true")"
    Write-Host "True $operator False = $(invoke-expression " `$true -$operator `$False")"
    Write-Host "False $operator True = $(invoke-expression " `$False -$operator `$true")"  
    Write-Host "False $operator False = $(invoke-expression " `$False -$operator `$False")"
}
Get-Truthtable