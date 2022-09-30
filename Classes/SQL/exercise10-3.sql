Select ones.x + tens.X + 1 as counter
from 
	(Select 0 as x union all
Select 1 as x union all
Select 2 as x union all
Select 3 as x union all
Select 4 as x union all
Select 5 as x union all
Select 6 as x union all
Select 7 as x union all
Select 8 as x union all
Select 9 as x ) ones cross join
(Select 0 as x union all
Select 10 as x union all
Select 20 as x union all
Select 30 as x union all
Select 40 as x union all
Select 50 as x union all
Select 60 as x union all
Select 70 as x union all
Select 80 as x union all
Select 90 as x ) tens
order by counter