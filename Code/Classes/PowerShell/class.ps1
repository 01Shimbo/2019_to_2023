class Device {
    $name
    $IpAddress
    $MacAddress
}
$d = [Device]::new()
# also can be created by comand line usitn $d=New-Object Device
$d.IpAddress = '192.168.1.1'
$d.Name = 'printer'
$d.MacAddress = 'ab:ab:ab:ab:ab:12'

class Metal {
    [string]$Symbol
    [string]$Name
    [int]$MeltingPoint
    [double]$SpecificGravity
}
$metal = [Metal]::new()
Import-csv psfiles\data\Metals.csv | ForEach-Object { [Metal]$_ }
$metal | Sort-Object $Name

#use hidden so it wont be read is usful for putting numbers just for doing math/formulas
class Circle {
    hidden static $pi = 3.1415927
    $Radius = 0
    $color = 'blue'
    #default constructor
    circle() {}
    circle($Radius) {
        $this.Radius = $Radius
    }
    #static method
    static [double] Area ([Double] $Radius) {
        return [Circle]::pi * [math]::Pow($Radius, 2)
    }
    # instance method
    [double] Area() {
        return [circle]::pi * [math]::Pow($this.Radius, 2)
    }
}
# to run class circle
$c = [Circle]::new()

class BetterCircle:circle {
    BetterCircle() {}
    BetterCircle($Radius) {
        $this.Radius
    }
    $texture = 'smooth'
    [double]Circumference() {
        return 2 * [math]::pi * $this.Radius
    }
}
enum rarity{ common = 0; semiprecious = 1; precious = 2 }
[rarity] $r = precious
# $r = 2
# resault: precious
# $r = precious
# resault: precious