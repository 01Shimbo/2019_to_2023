$csb = [System.Data.Odbc.OdbcConnectionStringBuilder]::new() 
$csb.Driver = 'Microsoft Access Driver (*.mdb, *.accdb)' 
$csb.add('dbq', 'C:\Users\Shane\Documents\practiceCode\PowerShell\psfiles\data\gems.mdb') 
$da = [System.Data.Odbc.OdbcDataAdapter]::new('SELECT * FROM gem', $csb.ConnectionString) 
$ds = [System.Data.DataSet]::new($da) 
$da.fill($ds) 
$ds.Tables[0] | Format-Table
# $csb = [System.Data.Odbc.OdbcConnectionStringBuilder]::new() 
# $csb.Driver = 'Microsoft Access Driver (*.mdb, *.accdb)' 
# $csb.add('dbq', 'C:\Users\Shane\Documents\practiceCode\PowerShell\psfiles\data\gems.mdb') 
# $con = [System.Data.Odbc.OdbcConnection]::new($csb.ConnectionString)
# $cmd = [System.Data.Odbc.OdbcCommand]::new('select * from gem', $con) 
# $reader = $cmd.ExecuteReader()
# While ($reader.Read()) { 
#     Write-host $reader['Mineral'] $reader['hardness']
# } $reader.Close()
# $con.Close()