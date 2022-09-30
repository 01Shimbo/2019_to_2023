-- Select		f.film_id, f.title, i.inventory_id
-- from		inventory i right join film f
-- on			f.film_id = i.film_id
-- where		f.title REGEXP '^RA(I|N).*$'
-- order by f.film_id, f.title, i.inventory_id;

-- exercise 10-5 

Select		f.film_id
, 			f.title
,			i.inventory_id
from		inventory i inner join film f
on			f.film_id = i.film_id
where		f.film_id in (712, 713)
order by 	f.film_id
,			f.title
, 			i.inventory_id;