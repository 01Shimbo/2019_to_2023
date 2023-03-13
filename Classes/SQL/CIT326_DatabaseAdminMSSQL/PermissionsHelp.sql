CREATE SERVER ROLE [DaisysRole] AUTHORIZATION [SHIMBO-FRAMEWOR\idaho]
ALTER SERVER ROLE [DaisysRole] ADD MEMBER [daisy]
GO
use [sample]
Go 
GRANT SELECT ON [assinments].[works_on] TO [DaisysRole]
GO