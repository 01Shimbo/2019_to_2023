--Example 12 creates an encryption key called cert01
USE master;
CREATE MASTER KEY
ENCRYPTION BY PASSWORD = 'password';
GO                                 
CREATE CERTIFICATE cert01
       WITH SUBJECT = 'Certificate for dbo';
--Example 12.2 show ecryption keys on sever
SELECT p.name, c.name, certificate_id
            FROM sys.database_principals p, sys.certificates c
            WHERE p.principal_id = p.principal_id;
--Example 12.3 
USE castro_bowling_stolen;
GO
-- Associate the certificate to the sample database
USE castro_bowling_stolen
CREATE DATABASE ENCRYPTION KEY
WITH ALGORITHM = AES_128
ENCRYPTION BY SERVER CERTIFICATE cert01;
--Example 12.4 turns encryption for database
USE master;
ALTER DATABASE castro_bowling_stolen SET ENCRYPTION ON;
--Example 12.5 shows encrypted databases
USE master;
SELECT * FROM sys.dm_database_encryption_keys
  WHERE encryption_state = 3;