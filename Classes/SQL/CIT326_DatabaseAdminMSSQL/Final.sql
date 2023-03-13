-- NEW SCHEMAS AND ADDED TABLES
CREATE SCHEMA Secure;
GO
IF (NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'Secure')) 
BEGIN
   EXEC ('CREATE SCHEMA [Secure] AUTHORIZATION [dbo]')
END
ALTER SCHEMA  Secure
    TRANSFER [Sales].[CreditCard]
ALTER SCHEMA  Secure
    TRANSFER [Person].[Password]
GO
CREATE SCHEMA Employee;
GO
IF (NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'Employee')) 
BEGIN
   EXEC ('CREATE SCHEMA [Employee] AUTHORIZATION [dbo]')
END
ALTER SCHEMA  Employee
    TRANSFER [HumanResources].[Employee]
ALTER SCHEMA  Employee
    TRANSFER [HumanResources].[Shift]
GO
--New user

USE [master]
GO
CREATE LOGIN [final_test_user] WITH PASSWORD=N'Password1!', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [AdventureWorks2019]
GO
CREATE USER [final_test_user] FOR LOGIN [final_test_user]
GO
GRANT SELECT ON SCHEMA :: [Employee] TO [final_test_user]

--Create View

Use AdventureWorks2019
Go
CREATE VIEW		[Employee].[schedules] AS
SELECT			LoginID
				,ShiftID
				,StartDate
FROM			[Employee].[Employee] AS ee
INNER JOIN		[HumanResources].[EmployeeDepartmentHistory] AS he
ON				ee.BusinessEntityID = he.BusinessEntityID

--NEW USER AND ROLE

USE [master]
GO
CREATE LOGIN [final_running_buddy] WITH PASSWORD=N'Password1!', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [AdventureWorks2019];
GO
CREATE USER [final_running_buddy] FOR LOGIN [final_running_buddy]
GO
CREATE ROLE [employees_role] AUTHORIZATION [dbo];
GO
ALTER ROLE [employees_role] ADD MEMBER [final_running_buddy];
GO
GRANT SELECT ON SCHEMA :: [Employee] TO [employees_role];
GRANT SELECT ON [Employee].[schedules] TO [employees_role];
GRANT SELECT ON [Purchasing].[Vendor] TO [employees_role];
BACKUP DATABASE [AdventureWorks2019] TO  DISK = N'/var/opt/mssql/data/AdventureWorks2019full.bak' WITH NOFORMAT, NOINIT,  NAME = N'AdventureWorks2019-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO
USE [master]
ALTER DATABASE [AdventureWorks2019] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
RESTORE DATABASE [AdventureWorks2019] FROM  DISK = N'/var/opt/mssql/data/AdventureWorks2019full.bak' WITH  FILE = 1,  MOVE N'AdventureWorks2017' TO N'/var/opt/mssql/data/AdventureWorks2019.mdf',  MOVE N'AdventureWorks2017_log' TO N'/var/opt/mssql/data/AdventureWorks2019_log.ldf',  NOUNLOAD,  REPLACE,  STATS = 5
ALTER DATABASE [AdventureWorks2019] SET MULTI_USER
GO