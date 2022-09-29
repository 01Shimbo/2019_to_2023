use sakila;
drop procedure if exists set_full_group_by;
delimiter $$
create procedure set_full_group()
	language sql
    not deterministic
    sql security definer
    comment 'set connection parameter when not set.'
begin
	if not exists (select null 
		where regexp_like(@@sql_mode, 'only_full_group_by'))
	then
		set sql_mode=(select concat(@@sql_mode,'only_full_group_by'));
	end if;
end
$$

delimiter ;
call set_full_group_by();
select customer_id
,	count(*)
,	sum(amount)
from payment
group by customer_id;