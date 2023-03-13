SELECT bs.database_name,
	backuptype = CASE
			WHEN bs.type = 'D'
			AND bs.is_copy_only = 0 THEN 'Full Database'
			WHEN bs.type = 'D'
			AND bs.is_copy_only = 1 THEN 'Full Copy-Only Database'
			WHEN bs.type = 'I' THEN 'Differential database backup'
			WHEN bs.type = 'L' THEN 'Transaction Log'
			WHEN bs.type = 'F' THEN 'File or filegroup'
			WHEN bs.type = 'G' THEN 'Differential file'
			WHEN bs.type = 'P' THEN 'Partial'
			WHEN bs.type = 'Q' THEN 'Differential partial'
		END + ' Backup',
	CASE bf.device_type
			WHEN 2 THEN 'Disk'
			WHEN 5 THEN 'Tape'
			WHEN 7 THEN 'Virtual device'
			WHEN 9 THEN 'Azure Storage'
			WHEN 105 THEN 'A permanent backup device'
			ELSE 'Other Device'
		END AS DeviceType,
	bms.software_name AS backup_software,
	bs.recovery_model,
	BackupStartDate = bs.Backup_Start_Date,
	BackupFinishDate = bs.Backup_Finish_Date,
	LatestBackupLocation = bf.physical_device_name,
	backup_size_mb = CONVERT(decimal(10, 2), bs.backup_size/1024./1024.),
	compressed_backup_size_mb = CONVERT(decimal(10, 2), bs.compressed_backup_size/1024./1024.)
FROM msdb.dbo.backupset bs
LEFT OUTER JOIN msdb.dbo.backupmediafamily bf ON bs.[media_set_id] = bf.[media_set_id]
INNER JOIN msdb.dbo.backupmediaset bms ON bs.[media_set_id] = bms.[media_set_id]
ORDER BY bs.database_name ASC, bs.Backup_Start_Date DESC;


USE [master]
BACKUP LOG [BowlingLeagueExample] TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\BowlingLeagueExample_LogBackup_2022-05-12_18-38-35.bak' WITH NOFORMAT, NOINIT,  NAME = N'BowlingLeagueExample_LogBackup_2022-05-12_18-38-35', NOSKIP, NOREWIND, NOUNLOAD,  NORECOVERY ,  STATS = 5
RESTORE DATABASE [bowling_TEST] FROM  DISK = N'E:\Databases\Backups\BowlingLeagueExample.bak' WITH  FILE = 1,  MOVE N'BowlingLeagueExample' TO N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\bowling_TEST.mdf',  MOVE N'BowlingLeagueExample_log' TO N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\bowling_TEST_log.ldf',  NOUNLOAD,  STATS = 5

GO

USE [master]
RESTORE DATABASE [shane_bowling_development] FROM  DISK = N'/home/shane_bowling_development.bak' WITH  FILE = 1,  MOVE N'BowlingLeagueExample' TO N'/var/opt/mssql/data/shane_bowling_development.mdf',  MOVE N'BowlingLeagueExample_log' TO N'/var/opt/mssql/data/shane_bowling_development_log.ldf',  NOUNLOAD,  STATS = 5

GO



