# $da=[Sytem.Data.Obdc.OdbcDataAdapter]::new('select * form gem', 'Dsn+gems')
# $ds = [System.Data.DataSet]::new($da)
# $da.fill($ds)
# $ds.tables[0]

#using the builder
$csb = [system.data.obdc.odbcConnectionStringBuilder]::New()
$csb.Driver="Microsoft Access Driver (*.mdb *.accdb)"
$csb.add('dbq',"C:\Users\Shane\Documents\psfiles\data\gems.mdb" )
$csb.ConnectionString
$sql=[System.Data.Obdc.OdbcDataAdapter]::new($sql,$csb.connectionstring)
$ds = [System.Data.DataSet]::new($da)
$da.fill($ds)
$ds.tables[0] | Format-Tabel