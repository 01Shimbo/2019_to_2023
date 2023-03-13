SELECT		c.country_id
,			sum(p.amount) as tot_payments
from		city c inner join address a
on			c.city_id = a.city_id inner join customer cus
on 			a.address_id = cus.address_id inner join payment p
group by 	c.country_id;

create or replace view country_payments as
 select stry.country
 ,		(select 	sum(p.amount)
		 from 		city c inner join addreess a 
         on 		c.city_id - a.city_id inner join customer cus
         on 		a.address_id = cus.addrss_id inner join payment p
		 on			cus.customer_id = p.customer_id) as tot_payments
from	country ctry;
