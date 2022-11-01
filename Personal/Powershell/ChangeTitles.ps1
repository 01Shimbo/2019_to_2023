param($jsonpath,$path,$name)

$filepath = Get-ChildItem -Path $path | % { @{Path = $_.fullname } }
$shows = Get-Content $jsonpath | ConvertFrom-Json
$episodeArray = $shows.episodes.episode
$episodeTitle = $shows.episodes.title 

$i = -1
do {
    $i = $i + 1
    $episode = $filepath[$i].Values.Split("-")
    $episode = $episode[-1].Trim()
    # write-host "FILE NUMBER: $($episode[-1])"
    $season = $filepath[$i].Values.Split("\")
    $season = $season[-2].Split(' ')
    $season = $season[-1]
    if ($i -lt 9) {
        $e = "S01E00$($i + 1).mkv"#; write-host "MY NUMBER: " $e
    }
    elseif ($i -lt 99) {
        $e = "S01E0$($i + 1).mkv"#; write-host "MY NUMBER: " $e
    }
    else {
        $e = "S01E$($i + 1).mkv"#; write-host "MY NUMBER: " $e
    }
    if ($i -lt 9) {
        $se = "S0$($season)E00$($i + 1).mkv"#; write-host "MY NUMBER: " $e
    }
    elseif ($i -lt 99) {
        $se = "S0$($season)E0$($i + 1).mkv"#; write-host "MY NUMBER: " $e
    }
    else {
        $se = "S0$($season)E$($i + 1).mkv"#; write-host "MY NUMBER: " $e
    }
    #check for invalid file characters 
    if ($episodeTitle[$i] | Where-object { $_ -eq [IO.Path]::GetInvalidFileNameChars() -join '' }) {
        # Write-Host "must clean" $episodeTitle[$i]
        [IO.Path]::GetinvalidFileNameChars() | ForEach-Object {$episodeTitle[$i] = $episodeTitle[$i].Replace($_," ").Trim()}
        # $episode = $episode[-1].Trim()
        # $episodeTitle[$i]
    }   
    if ($episode | Where-Object { $_ -eq $e }) {
        Write-Host 'found' -ForegroundColor green
        # write-host "Episode $($se) path: $($filepath[$i].Values) Title: $($episodeTitle[$i])";
        if ($se | Where-Object { $_ -eq $se }) {
            Write-host "Rename will start" -ForegroundColor Yellow
            Write-Host "Rename-Item -path $($filepath[$i].Values) -NewName "$name_$($episodeTitle[$i])-$($se)"" -ForegroundColor Green
            Rename-Item -path $($filepath[$i].Values) -NewName $name"_""$($episodeTitle[$i])-$($se)"
            # Write-host true -ForegroundColor Green
        } 
        else { Write-Host "|$($e)| does note equal |$($episode)|" -ForegroundColor Red }   
    }
    else { Write-Host 'not found' }
}   
while ($i + 2 -le $episodeArray.Count)
Write-Host "--end of script-- "
# script improvements
# script could run python search sript to search the imdb
