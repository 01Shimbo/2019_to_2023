Select 	 c.customer_id
,		 concat(c.first_name, ' ', c.last_name) AS 'customer name'
, 		 count(p.payment_id) as payments
,		 sum(p.amount)
from 	 customer c inner join payment p
on		 c.customer_id = p.customer_id
where	 c.customer_id in (1,4,210)
group by c.customer_id
,		 'customer name'
order by 'customer name';