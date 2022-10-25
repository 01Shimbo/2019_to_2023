
$OAuth = "BQCYHB7J8VrOqBvxpNfR_g1w31Qq4yFwz1v-JIFe75FiMfOfPxw9pmN-F52jyHpbuUdblJKct0DnLaymqgcs2zrp-vL4D7BeNAeZVRZOgymnlFs6AfDW_K_J0CwBHxj7QGPp3HHa9MQMpI6HL1dvjNfQneT4ijfMkeXf0ZphefTAdLKQ"
$URL = "https://api.spotify.com/v1/me/player/recently-played?limit=10&after=1484811043508"

curl -X "GET" $URL -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer $OAuth" | Out-File .\RecentPlayed.json