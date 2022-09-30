select  f.title 
from 	film f 
where exists
		(select fc.film_id
		from 	film_category fc inner join category c
		on 		fc.category_id = c.category_id
		where c.name = 'Action'
        and fc.film_id = f.film_id);