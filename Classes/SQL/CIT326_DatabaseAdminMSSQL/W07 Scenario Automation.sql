use msdb
go
DROP TABLE IF EXISTS CustomAudit.sa_logins$(ESCAPE_NONE(DATE))

CREATE TABLE CustomAudit.sa_logins$(ESCAPE_NONE(DATE))
	(
	name VARCHAR (150),
	type VARCHAR (20) NULL,
	is_disabled BIT NULL
);

GO
INSERT INTO CustomAudit.sa_logins$(ESCAPE_NONE(DATE)) (name, type, is_disabled)
SELECT   name,type_desc,is_disabled
FROM     master.sys.server_principals 
WHERE    IS_SRVROLEMEMBER ('sysadmin',name) = 1


USE [master]
GO
CREATE LOGIN [Ralph] WITH PASSWORD=N'password', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
CREATE USER [Ralph] FOR LOGIN [Ralph]
GO
CREATE LOGIN [Kerby] WITH PASSWORD=N'password', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
CREATE USER [Kerby] FOR LOGIN [Kerby]
GO
CREATE LOGIN [Link] WITH PASSWORD=N'password', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
CREATE USER [Link] FOR LOGIN [Link]
GO


ALTER SERVER ROLE [sysadmin] ADD MEMBER [Ralph]
ALTER SERVER ROLE [sysadmin] ADD MEMBER [Bill]
ALTER SERVER ROLE [sysadmin] ADD MEMBER [Tim]
ALTER SERVER ROLE [sysadmin] ADD MEMBER [Kerby]
ALTER SERVER ROLE [sysadmin] ADD MEMBER [Link]

