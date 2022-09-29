DROP TABLE IF EXISTS vehicle;
CREATE TABLE vehicle
(vehicle_id		int			unsigned primary key auto_increment
, vin			varchar(17)
, vehicle_name	varchar(64));
create unique index inx_vehicle_vin on vehicle(vin);
select	concat(s.table_schema,'.',s.table_name,'.'s.index_name,'.'s.column)
FROM	information_schema.statistics s
where	s.table_schema = database()
and		s.table_name = 'vehicle'
and		s.column_name = 'vin';
create unique index inx_vehicle_vin on vehicle(vehicle_id	);
select	concat(s.table_schema,'.',s.table_name,'.'s.index_name,'.'s.column)
FROM	information_schema.statistics s
where	s.table_schema = database()
and		s.table_name = 'vehicle'
and		s.column_name = 'vehicle_id	';