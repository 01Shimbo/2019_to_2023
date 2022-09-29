foreach ($n in $epnum){
    if ($n -lt 10){
        $n = "00$($n)"
    }
    elseif ($n -lt 100){
        $n = "0$($n)"
    }
    elseif ($n -lt 1000){
        $n = "$($n)"
    }
    $n
}