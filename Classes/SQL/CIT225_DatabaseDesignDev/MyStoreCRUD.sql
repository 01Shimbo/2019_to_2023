use mystore;
delete from address
where address = '123 deer road';
delete from country
where country_id = '123';
delete from city
where city_id = '345';
-- create 
insert into country (country, country_id)
values ('United States', '123');
select * from country;
insert into city (city, country_id, city_id) 
values ('Rexburg', '123', '345');
select * from city;
Insert into address (address, state, postal_code, phone, city_id )
values ('123 Deer Road', 'Idaho','83406','1231234', 345);
select * from address;
-- read
select * from address, city, country;
-- update
update country
set country = 'Canada'
where country_id = '123';

update city
set city = 'Vancouver'
where city_id = '345';

update address
set state = 'Onterio'
where address = '123 deer road';
-- test update
-- select * from address, city, country;
-- delete 
SET FOREIGN_KEY_CHECKS=0;
delete from address
where address = '123 deer road';
delete from country
where country_id = '123';
delete from city
where city_id = '345';
SET FOREIGN_KEY_CHECKS=1;
