select f.title
from film f
where f.film_id in
(select fc.film_id
from film_category fc inner join category c
on fc.category_id = c.category_id
where c.name = 'Action');