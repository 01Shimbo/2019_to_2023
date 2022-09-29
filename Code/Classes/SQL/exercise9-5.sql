select fa.actor_id
,      fa.film_id
from   film_actor fa
where  exists
		(select a.actor_id
        from    actor a
        where	a.last_name = 'MONROE'
        and		a.actor_id = fa.actor_id)
and		exists
		(select f.film_id
        from 	film f
        where	f.rating = 'PG'
        and		f.film_id = fa.film_id);