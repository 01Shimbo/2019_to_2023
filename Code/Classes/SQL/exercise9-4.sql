SELECT   fa.actor_id
,        fa.film_id
FROM     film_actor fa
WHERE    fa.actor_id IN
			(SELECT a.actor_id
            , 		f.film_id
			FROM 	film f inner join film_actor fa
            on		f.film_id = fa.film_id inner join actor a
            on 		fa.actor_id = a.actor_id
            WHERE 	f.rating = 'PG'
			and 	a.last_name = 'MONROE');