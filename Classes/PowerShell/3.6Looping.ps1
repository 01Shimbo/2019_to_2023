<#
Program Name : <Exercise 3.6 Looping >
Date: <1/23/2021>
Author: <Shane Duke>
Corse: CIT361
I, <Shane Duke>, affirm that I wrote this script as original work completed by me.
#>
#While loop that outputs the numbers 5-10 in the format of "Number #"
"While 5-10";"=" * 80
#Your code Here
$a=4
While(( $a = $a + 1) -le 10){
    write-host "Number" $a
}
#Do While loop that outputs the numbers from 100-150 counting by 10 in the format "Number #"
"Do while 100-150 by 10s";"=" * 80
#Your code Here
$b=90
do { $b = $b + 10;write-host "Number" $b} 
while($b -lt 150)
#Do Until loop that outputs the numbers from 1000 to 1500 counting by 100 in the format "Number #"
"Do until 1000-1500 by 100s";"=" * 80
#Your code Here
$c=900
do { $c = $c + 100;write-host "Number" $c} 
until($c -eq 1500)
#For loop that outputs the numbers from -5 to -1- in the format "Number #"
"For -5 to -10";"=" * 80
#Your code Here
for($d=-5;$d -ge -10;$d--){
    write-host "Number" $d
}
#Foreach loop that gets a list of files from the current directory and outputs the name and size in KB
"Foreach directory";"=" * 80
#Your code Here
# $items = Get-ChildItem | Format-Table Length, Name
# foreach($item in $items) {
#     write-host $item
# }
#Any loop that outputs the numbers from 1 to 10 skipping every third number using continue in the format "Number #"
"Continue 1 to 10 skipping every third number";"=" * 80
#Your code Here 
[array]$e = 1..10
foreach ($num in $e){
    if ($num % 2 -eq 0){continue}
    write-host "Number" $num
}
# im close just don't know what i'm missing