use sakila;
select  a.actor_id
,		l.level
from 	(select 	fa.actor_id
		, 			count(*) AS num_roles
		from 		film_actor fa
		group by 	actor_id) a inner join
		(select 'Hollywood Star' as level
		,	30 as min_roles
		,	99999 as max_roles
		union all
		select 'Prolific Actor' as level
		,	20 as min_roles
		,	29 as max_roles
		union all
		select 'Newcomer' as level
		,	1 as min_roles,
		,	19 as max_roles) l
ON 		a.num_roles between l.min_roles and l.max_roles;

