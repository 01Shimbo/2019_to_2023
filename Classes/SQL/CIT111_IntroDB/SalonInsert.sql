
-- insert into customer (customer_id, first_name, last_name, email, phone )
-- values(1, 'Jeana', 'Bradford', 'jb@gmail.com', '1112223333'),
-- (2,'Sandra', 'Hobbs',	'sh@gmail.com', '1112223334'),
-- (3, 'Ryan', 'Taylor', 'rt@gmail.com', '1112223335'),
-- (4, 'Michelle', 'Drake', 'md@gmail.com', '1112223336'),
-- (5, 'Heidi', 'Nolan', 'hn@gmail.com', '1112223337'),
-- (6, 'Karen', 'Smith', 'ks@gmail.com', '1112223338'),
-- (7, 'Jose', 'Mendez',	'jm@gmail.com',	'1112223339');

-- insert into employee (id_employee, first_name, last_name, title, hire_date, termination_date, email, phone, manager_id, location_id)
-- values
-- (1,	'Jenny', 'Jensen',	'Owner',	'2013-06-15', NULL,	'jensenj@salon.com'	,'2081112222',	1, NULL),	
-- (2,	'Haley', 'Lopez', 'Assistant Manager', '2013-08-23', NULL, 'lopezh@salon.com',	'2083334444',	1,	1),
-- (3, 'Robert', 'Green',	'Associate',	'2014-01-03', NULL , 'greenr@salon.com',	2085556666	,1,	2),
-- (4,	'Olive', 	'Adams',	'Manager',	'2015-07-12', NULL , 'adamso@salon.com',	2087778888	,2,	1),
-- (5, 'Julie',	'Davis',	'Associate',	'2015-10-20', NULL , 'davisj@salon.com', 2089990000	,2,	4);

-- insert into employee (product_id, name ,type ,size, price)
--  values
-- (1,	'Shampoo',	'Product',	8, 	4.95),
-- (2,	'Shampoo',	'Product',	16, 8.95),
-- (3,	'Conditioner','	Product',	12, 	8.95),
-- (4,	'Hairspray',	'Product',	8, 7.95),
-- (5, 'Shampoo',	'Service',	NULL,	8.00),
-- (6,	'Men Hair Cut',	'Service',	NULL,	15.00),
-- (7, 'Women Hair Cut',	'Service',	NULL,	25.00),
-- (8,	'Color',	'Service',	NULL,	50.00),
-- (9,	'Perm',	'Service',	NULL,	60.00);

-- insert into employee (TranID,	EmployeeID,	CustomerID, TranDate)
-- values
-- (1,	1,	7,	'2019-03-25'),
-- (2,	1,	6,	'2019-03-25'),
-- (3,	2,	5,	'2019-03-25'),
-- (4,	3,	4,	'2019-03-25'),
-- (5,	4,	3,	'2019-03-25');

SET IDENTITY_INSERT employee ON;
insert into employee (tran_detail_id, transaction_transaction_id, ProductIDproduct_product_id, quanitiy)
values
(1,	1,	1,	2),
(2,	1,	6,	1),
(3,	2,	9,	1),
(4,	2,	3,	3),
(5,	3,	8,	1),
(6,	4,	7,	1),
(7,	4,	2,	1),
(8, 5,	6,	1);
SET IDENTITY_INSERT employee off;