create or replace view film_actor_v as 
select f.title
,		a.first_name
,		a.last_name
from 	film f inner join film_actor fa
on		f.film_id = fa.film_id inner join actor a 
on 		fa.actor_id = a.actor_id;

select * from film_actor_v -- \G