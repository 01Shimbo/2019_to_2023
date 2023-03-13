use master
go
alter table [sample] 

-- how to see what the databese 
select name
		,recovery_model_desc
from
sys.databases
-- kicks everyone off the DB
alter database set singe_user with roll back