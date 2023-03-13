-- Q1)select tables that have are a user table
use			WideWorldImporters;

SELECT		name
			,create_date
			,modify_date
			,type
FROM		sys.tables
WHERE		type 
LIKE		'U'

use			BowlingLeagueExample;

SELECT		name
			,create_date
			,modify_date
			,type
FROM		sys.tables
WHERE		type 
LIKE		'U'

use			sample;

SELECT		name
			,create_date
			,modify_date
			,type
FROM		sys.tables
WHERE		type 
LIKE		'U'

-- Q2 select columns that include the string 'name'
USE			WideWorldImporters;

SELECT		c.name,
			c.max_length,
			t.name
FROM		sys.columns c
INNER JOIN	sys.tables t
ON			c.object_id=t.object_id
WHERE		c.name 
LIKE		'%name%'


USE			BowlingLeagueExample;

SELECT		c.name,
			c.max_length,
			t.name
FROM		sys.columns c
INNER JOIN	sys.tables t
ON			c.object_id=t.object_id
WHERE		c.name 
LIKE		'%name%'


USE			sample;

SELECT		c.name,
			c.max_length,
			t.name
FROM		sys.columns c
INNER JOIN	sys.tables t
ON			c.object_id=t.object_id
WHERE		c.name 
LIKE		'%name%'
--Q3 get size of databases
use WideWorldImporters
;
SELECT	name
		,physical_name
		,size * 8 as 'Size in KB' 
		,size * 8 / 1000 'Size in MB' 
FROM	sys.database_files
WHERE	size > 1024
;
SELECT	SUM(size * 8 / 1000) as 'Total Size of BowlingDB(MB)'
FROM	sys.database_files
;

use BowlingLeagueExample
;
SELECT	name
		,physical_name
		,size * 8 as 'Size in KB' 
		,size * 8 / 1000 'Size in MB' 
FROM	sys.database_files
WHERE	size > 1024

;
SELECT	SUM(size * 8 / 1000) as 'Total Size of BowlingDB(MB)'
FROM	sys.database_files
;

use sample
;
SELECT	name
		,physical_name
		,size * 8 as 'Size_in_KB' 
		,size * 8 / 1000 'Size_in_MB'
FROM	sys.database_files
WHERE	size > 1024
;
SELECT	SUM(size * 8 / 1000) as 'Total Size of SampleDB(MB)'
FROM	sys.database_files

--Q4a This looks at all the databases that have a size larger than 1024 on the instance.
--This would be important in cases where you are needing add a new server.
--The largest database could be moved to the new server.
--seeing the total storage that a database takeing up is important and
--is needed to calculate the amount of storage you will need in the future.
SELECT	name
		,physical_name
		,size * 8 as 'Size_in_KB' 
		,size * 8 / 1000 'Size_in_MB'
from	sys.master_files
where	size > 1024
;
SELECT	SUM(size * 8 / 1000) as 'Total Size of SampleDB(MB)'
FROM	sys.master_files
--Q4b This searches for the primary and forgen keys in a database.
-- I think this is usful to see the outline of a database 
use BowlingLeagueExample;
SELECT	*
FROM	sys.objects
WHERE type LIKE 'PK' OR type LIKE 'F'
ORDER BY parent_object_id asc
;