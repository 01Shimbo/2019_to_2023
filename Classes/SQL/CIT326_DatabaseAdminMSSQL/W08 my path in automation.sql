USE msdb
GO
-- CREATE VIEW CustomAudit.current_db_latency
-- AS
SELECT		DB_NAME(mf.database_id) AS [Database Name]
			,mf.physical_name [Physical Name]
			,num_of_reads
			,num_of_bytes_read
			,io_stall_read_ms
			,num_of_writes
			,num_of_bytes_written
			,io_stall_write_ms
			,io_stall
			,size_on_disk_bytes
			,mf.database_id
FROM		sys.dm_io_virtual_file_stats(4,null) AS vfs
INNER JOIN	sys.master_files AS mf
ON			mf.database_id = vfs.database_id
AND			mf.file_id = vfs.file_id
WHERE		mf.physical_name LIKE '%mdf'
GO

--is table created no > create > then instert data
-- database table Latency
-- logID | databaseID | latancy data
create table CustomAudit.WideWorldImporters_latency_audit
	(
	logID int IDENTITY(1,1) PRIMARY KEY
	,log_time date
	,num_of_reads bigint
	,num_of_bytes_read bigint
	,io_stall_read_ms bigint
	,num_of_writes bigint
	,num_of_bytes_written bigint
	,io_stall_write_ms bigint
	,io_stall bigint
	,size_on_disk_bytes bigint
	,database_id bigint

)
GO
Select	getdate() as log_time
		,num_of_reads
		,num_of_bytes_read
		,io_stall_read_ms
		,num_of_writes 
		,num_of_bytes_written 
		,io_stall_write_ms 
		,io_stall 
		,size_on_disk_bytes 
		,database_id 
FROM	CustomAudit.current_db_latency
WHERE	[Physical Name] LIKE '%mdf'
AND		database_id = 5
go 
USE msdb
GO
INSERT INTO CustomAudit.WideWorldImporters_latency_audit(
	log_time 
	,num_of_reads
	,num_of_bytes_read 
	,io_stall_read_ms 
	,num_of_writes 
	,num_of_bytes_written 
	,io_stall_write_ms 
	,io_stall 
	,size_on_disk_bytes 
	,database_id 
	)
Select	getdate() as log_time
		,num_of_reads
		,num_of_bytes_read
		,io_stall_read_ms
		,num_of_writes 
		,num_of_bytes_written 
		,io_stall_write_ms 
		,io_stall 
		,size_on_disk_bytes 
		,database_id 
FROM	CustomAudit.current_db_latency
WHERE	[Physical Name] LIKE '%mdf'
AND		database_id = 5
go 
use msdb
go

create table CustomAudit.WideWorldImporters_latency_audit
	(
	logID int IDENTITY(1,1) PRIMARY KEY
	,log_time datetime
	,num_of_reads bigint
	,num_of_bytes_read bigint
	,io_stall_read_ms bigint
	,num_of_writes bigint
	,num_of_bytes_written bigint
	,io_stall_write_ms bigint
	,io_stall bigint
	,size_on_disk_bytes bigint
	,database_id bigint

)

use msdb
go
EXEC sp_columns 'current_db_latency', 'CustomAudit'
