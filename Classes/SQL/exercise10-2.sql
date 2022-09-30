Select		concat(c.first_name, ' ', c.last_name) AS 'customer name'
,			sum(p.amount)
from 		customer c right outer join payment p
on 			c.customer_id = p.customer_id
where 		c.customer_id in (1,4,210)
group by 	'customer name'
order by	'customer name';