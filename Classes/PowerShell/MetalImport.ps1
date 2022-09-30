class Metal {
    [string]$Symbol
    [string]$Name
    [long]$MeltingPoint
    [double]$SpecificGravity
}
# $m1 = [metal]::new()
# $m1.Symbol = 'Au' 
# $m1.Name = 'Gold' 
# $m1.MeltingPoint = 1945 
# $m1.SpecificGravity = 19.3
# $m2 = New-Object Metal
# $m2
# $m3 = [metal]@{Symbol = 'Au'; Name = 'Gold' }
# $m3
$Metals = Import-Csv Metals.csv|ForEach-Object {[Metal]$_}
$Metals[0].GetType()