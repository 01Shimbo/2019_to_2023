create or replace view film_category_actor as
select 	f.title
,		c.name category_name
,		a.first_name
,		a.last_name
from	film f inner join film_category fc
on		f.film_id = fc.film_id inner join category c
on		fc.category_id = c.category_id inner join film_actor fa
on 		f.film_id = fa.film_id inner join actor a
on		fa.actor_id = a.actor_id;

select 	title
,		category_name
,		first_name
,		last_name
from	film_category_actor
where	last_name = 'FAWCETT';
