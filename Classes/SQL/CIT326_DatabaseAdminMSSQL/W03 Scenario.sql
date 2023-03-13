-- 1a What is Windows authentication in SQL Server? What is one benefit to Windows Authentication 
-- over SQL Authentication?
	-- Windows authentication uses authenciation on operating system level.
	-- using Windows authenication allows for permissions to be assined though Active Directory.

-- 1b Explain the difference between authentication and authorization. 
-- Give an example of authorization in the database.
	-- Authenication looks at credtiantals to get in to a restricted area andswers the question who am I.
	-- Authurization refers to what a person can do in a restricted area andswers the question what can I do
	-- EX. Authorization is used when a user part who is a part of a group called 'interns' and are denied premissions to a data base with sensitve data.

-- 1c Verify your SQL Server installation is in mixed authorization mode
-- and can accept both Windows and SQL Server Authentication.

SELECT CASE SERVERPROPERTY('IsIntegratedSecurityOnly')   
WHEN 1 THEN 'Windows Authentication ONLY'   
WHEN 0 THEN 'MIXED'   
END as [Authentication Mode]

-- 1d What would happen if you grant SELECT permission on a table to the fixed database 
-- role called 'public?' Would this granted permission apply to future users also (users that are not created yet)? Why could this be dangerous?
	-- giving permissions to public is not very secure becasue those premissions could be forgoten about. 
	-- A new users could have persmission to data that they.
	-- should not have access to.

-- 2a Create two new schemas for the Bowling database and two more for an additional database of your choice. You will be creating four schemas total.
USE BowlingLeagueExample
GO
CREATE SCHEMA [secure]
GO
CREATE SCHEMA [opensource]
GO
USE [sample]
GO
CREATE SCHEMA [business]
GO
CREATE SCHEMA [assinments]
GO

-- 2b Transfer the tables in the bowling database and your chosen database out of the dbo (database owner) schema and into the four new schemas.
-- How you choose to separate the tables into these schemas is completely up to you (you will not be graded on that choice).

USE BowlingLeagueExample;  
GO  
ALTER SCHEMA opensource TRANSFER dbo.teams 
ALTER SCHEMA opensource TRANSFER dbo.tournaments
ALTER SCHEMA opensource TRANSFER dbo.Match_Games  
ALTER SCHEMA opensource TRANSFER dbo.Tourney_Matches    
ALTER SCHEMA secure TRANSFER dbo.Bowler_Scores 
ALTER SCHEMA secure TRANSFER dbo.Bowlers
ALTER SCHEMA secure TRANSFER dbo.ztblSkipLabels
ALTER SCHEMA secure TRANSFER dbo.ztblWeeks
ALTER SCHEMA secure TRANSFER dbo.ztblBowlerRatings
GO   
USE [sample]
GO  
ALTER SCHEMA business TRANSFER dbo.department 
ALTER SCHEMA business TRANSFER dbo.employee
ALTER SCHEMA assinments TRANSFER dbo.project
ALTER SCHEMA assinments TRANSFER dbo.works_on
ALTER SCHEMA assinments TRANSFER dbo.ClassTEST
GO   

-- 2c Create four new logins and map them to each database (two for each database).
-- Issue a grant command that will give SELECT rights on an entire schema (one for each user).
-- Do this for each of the four logins. Test this authorization by logging in with these new users.

USE [master]
GO
CREATE LOGIN [mairo] WITH PASSWORD=N'password', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [BowlingLeagueExample]
GO
CREATE USER [mairo] FOR LOGIN [mairo]
GO
USE [BowlingLeagueExample]
GO
ALTER USER [mairo] WITH DEFAULT_SCHEMA=[secure]
GO
CREATE LOGIN [lugi] WITH PASSWORD=N'password', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [BowlingLeagueExample]
GO
CREATE USER [lugi] FOR LOGIN [lugi]
GO
USE [BowlingLeagueExample]
GO
ALTER USER [lugi] WITH DEFAULT_SCHEMA=[opensource]
GO
CREATE LOGIN [peach] WITH PASSWORD=N'password', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE sample
GO
CREATE USER [peach] FOR LOGIN [peach]
GO
USE [sample]
GO
ALTER USER [peach] WITH DEFAULT_SCHEMA=[business]
GO
CREATE LOGIN [daisy] WITH PASSWORD=N'password', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [sample]
GO
CREATE USER [daisy] FOR LOGIN [daisy]
GO
USE [sample]
GO
ALTER USER [daisy] WITH DEFAULT_SCHEMA=[assinments]
GO
--  3a Create a list of DCL, to assign to every future entry-level user of a given database.
USE [BowlingLeagueExample]
GO
GRANT SELECT ON [opensource].[Match_Games] TO [lugi]
GRANT SELECT ON [opensource].[Teams] TO [lugi]
GRANT SELECT ON [opensource].[Tournaments] TO [lugi]
GRANT SELECT ON [opensource].[Tourney_matches] TO [lugi]
GRANT SELECT ON [secure].[Bowler_Scores] TO [mairo]
GRANT SELECT ON [secure].[Bowlers] TO [mairo]
GRANT SELECT ON [secure].[ztblBowlerRatings] TO [mairo]
GRANT SELECT ON [secure].[ztblSkipLabels] TO [mairo]
GRANT SELECT ON [secure].[ztblWeeks] TO [mairo]
GO
USE [sample]
GO
GRANT SELECT ON [assinments].[project] TO [daisy]
GRANT SELECT ON [assinments].[works_on] TO [daisy]
GRANT SELECT ON [business].[department] TO [peach]
GRANT SELECT ON [business].[employee] TO [peach]
GO

-- create a roles and add permsissions
USE [BowlingLeagueExample]
GO
CREATE ROLE [MarioRole] 
ALTER ROLE [MarioRole] ADD MEMBER [mairo]
GRANT SELECT ON [secure].[Bowlers] TO [MarioRole]
GRANT SELECT ON [secure].[ztblBowlerRatings] TO [MarioRole]
GRANT SELECT ON [secure].[ztblSkipLabels] TO [MarioRole]
GRANT SELECT ON [secure].[ztblWeeks] TO [MarioRole]
CREATE ROLE [LugiRole] 
ALTER ROLE [LugiRole] ADD MEMBER [lugi]
GRANT SELECT ON [opensource].[Match_Games] TO [LugiRole]
GRANT SELECT ON [opensource].[Teams] TO [LugiRole]
GRANT SELECT ON [opensource].[Tournaments] TO [LugiRole]
GRANT SELECT ON [opensource].[Tourney_matches] TO [LugiRole]
GO
USE [sample]
Go
CREATE ROLE [PeachRole]
ALTER ROLE [PeachRole] ADD MEMBER [peach]
GRANT SELECT ON [business].[department] TO [PeachRole]
GRANT SELECT ON [business].[employee] TO [PeachRole]
CREATE ROLE [DaisyRole]
ALTER ROLE [DaisyRole] ADD MEMBER [daisy]
GRANT SELECT ON [assinments].[project] TO [DaisyRole]
GRANT SELECT ON [assinments].[works_on] TO [DaisyRole]
GO
