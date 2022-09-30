$UtilitiesProgress = 'SilentlyContinue'
function Get-UtilitiesProgressPreference {
    $UtilitiesProgress
    
}
function Set-UtilitiesProgressPreference {
    param (
        [Parameter(Mandatory)]
        [validateeSet('SilentlyContinue', 'Continue')]
        $Preference
    )
    $Script:UtilitiesProgress = $Preference
}
function Get-WebFile {
    param(
        [parameter(Mandatory)]
        [string]$Uri,
        [parameter(Mandatory)]
        [string]$outFile
    )
    #save current preference
    $pref = $Global:ProgressPreference
    # use the module pref
    $Global:ProgressPreference = $UtilitiesProgress
    Invoke-WebRequest -Uri $Uri -OutFile $outFile
    #restore pref
    $Global:ProgressPreference = $pref
}
