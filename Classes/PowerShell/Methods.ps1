enum colors {
    red = 0;
    blue = 1;
    green = 2
}
Class circle {
    static $Pi = 3.1415927
    [double]$diameter
    [colors]$color
    Circle() {}
    Circle([double]$diameter) {
        $this.diameter = $diameter
    }
    static[double]Area([double]$diameter) {
        return [circle]::Pi * [math]::pow($diameter / 2, 2)
    }
    [double]Area() {
        return [circle]::Area($this.diameter)
    }
}
Class Column:Circle {
    [double]$height
    Column ([double]$diameter, [double]$height):base($diameter) {
        $this.Height = $height
    } 
    static [double] Volume([double]$diameter, [double]$height) {
        return [circle]::Area($diameter) * $height
    } 
    [double]Voulme() {
        return $this.Area() * $this.Height
    }
}
[enum]::GetNames([colors])
$c = [circle]::new()
$c