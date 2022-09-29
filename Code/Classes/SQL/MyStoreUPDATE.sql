use mystore;
insert into country (country, country_id)
values ('United States', '123');
select * from country;
insert into city (city, country_id, city_id) 
values ('Rexburg', '123', '345');
select * from city;
Insert into address (address, state, postal_code, phone, city_id )
values ('123 deer road', 'idaho','83406','1231234', 345);
select * from address;