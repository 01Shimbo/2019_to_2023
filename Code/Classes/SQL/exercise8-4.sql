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
select f.title, concat(a.first_name, ', ', a.last_name) as name, f.rating, count(*)
from film f inner join film_actor fa
on f.film_id = fa.film_id inner join actor a
on fa.actor_id = a.actor_id
where f.rating like 'PG%' or 'G' or 'PG-13'
group by f.title, f.rating
having count(*) between 9 and 12
order by f.title;