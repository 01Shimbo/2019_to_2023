$da = [System.Data.Odbc.OdbcDataAdapter]::new('select * from gem', 'DSN=gems')
$ds = [System.Data.DataSet]::new()
$da.fill($ds)
$ds.Tables[0] | Format-Table
Write-Host 'table count:'$ds.Tables.Count
Write-Host 'row count:'$ds.Tables.rows.Count
$ds.Tables[0] |Where-Object hardness -ge 5 |Select-Object mineral, hardness | Sort-Object hardness -Descending #| Measure-Object