-- step 4
USE         [shane_bowling_development]
GO
SELECT	    [BowlerLastName] + [BowlerFirstName]  + '@gmail.com' as BowlerEmail
FROM	    secure.Bowlers
GO
ALTER TABLE secure.Bowlers
ADD         BowlerEmail VARCHAR (50)
GO
UPDATE      secure.Bowlers
SET         [BowlerEmail] = [BowlerLastName] + [BowlerFirstName]  + '@gmail.com'

USE [master]
GO
CREATE LOGIN [bob_duke_the_scorekeeper] WITH PASSWORD=N'password', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
CREATE LOGIN [carol_duke_the_programmer] WITH PASSWORD=N'password', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [shane_bowling_development]
GO
CREATE USER [bob_duke_the_scorekeeper] FOR LOGIN [bob_duke_the_scorekeeper]
CREATE USER [carol_duke_the_programmer] FOR LOGIN [carol_duke_the_programmer]
GO
CREATE VIEW shanes_junior_employee_bowlers
AS
SELECT		BowlerID
			,BowlerLastName
			,BowlerFirstName
			,BowlerMiddleInit
			,BowlerCity
			,BowlerState
			,BowlerZip
			,TeamID
FROM		secure.Bowlers	
GO
GRANT SELECT ON [dbo].[shanes_junior_employee_bowlers] TO [bob_duke_the_scorekeeper]
GRANT SELECT ON [secure].[Bowlers] TO [carol_duke_the_programmer]
GRANT INSERT ON [secure].[Bowlers] TO [carol_duke_the_programmer]