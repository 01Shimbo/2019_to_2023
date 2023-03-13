insert into student (student_id, student_name, gender, city, state, dob) value 
(1, 'Paul',	'M',	'Dallas',	'TX',	'1996-2-22'),
(2, 'Katie',	'F',	'Provo',	'UT',	'1995-7-22'),
(3, 'Kelly',	'F',	'Provo',	'UT',	'1998-6-22'),
(4, 'Devon',	'M',	'Mesa',	'AZ',	'2000-07-22'),
(5, 'Mandy',	'F',	'Topeka',	'KS',	'1996-11-22'),
(6, 'Alece',	'F',	'Rigby',	'ID',	'1997-05-22'),
(7, 'Bryce',	'M',	'Bozeman',	'MT',	'1997-11-22'),
(8, 'Preston',	'M',	'Decatur',	'TN',	'1996-09-22'),
(9, 'Julia', 'F',	'Rexburg',	'ID',	'1998-09-22'),
(10, 'Susan',	'F',	'Mesa',	'AZ',	'1998-09-08');
insert into catalog (catalog_id, college, department, deptcode, course, course_number, credits) value
(1, 'College of Business and Communication', 	'Computer Information Technology', 	'CIT' ,	'Intro to Databases', 	'111', 	3),
(2, 'College of Business and Communication',  	'Economics', 'ECON', 	'Econometrics', 	'388', 	4),
(3, 'College of Business and Communication', 	'Economics', 	'ECON', 	'Micro Economics',	'150',	3),
(4, 'College of Language and Letters', 	'Humanities and Philosophy', 	'HUM', 	'The Classical Heritage', 	'376', 	2);
insert into registration (registration_id, regi_year, regi_term, section, professor, capacity, catalog_catalog_id ) value
(1,	'2016',	'Fall',	'1', 'Morring', 30,	1),
(2,	'2016',	'Fall', '1',	'Nate',	50,	3),
(3,	'2016',	'Fall',	'2',	'Nate',	50, 3),
(4,	'2016',	'Fall',	'1',	'Barrus',	35,	2),
(5,	'2016',	'Fall',	'1',	'Jensen',	30,	4),
(6,	'2017',	'Winter',	'2',	'Morring',	30,	1),
(7,	'2017',	'Winter',	'3',	'Barney',	35,	1),
(8,	'2017',	'Winter',	'1',	'Nate',	50,	3),
(9,	'2017',	'Winter',	'2',	'Nate',	50,	3),
(10,	'2017',	'Winter',	'1',	'Jensen',	30,	4);
insert into enroll (enroll_id, enroll_year, enroll_term, student_student_id, registration_registration_id) values
(1,	'2017',	'Winter',	6,	7),
(2,	'2017',	'Winter',	7,	6),
(3,	'2017',	'Winter',	7,	8),
(4,	'2017',	'Winter',	7,	10),
(5,	'2016', 'Fall',	4,	5),
(6,	'2017',	'Winter',	9,	9),
(7,	'2016',	'Fall',	2,	4),
(8,	'2016',	'Fall',	3,	4),
(9,	'2016',	'Fall',	5,	4),
(10,	'2016',	'Fall',	5,	5),
(11,	'2016',	'Fall',	1,	1),
(12,	'2016',	'Fall',	1,	3),
(13,	'2017',	'Winter',	8,	9),
(14,	'2017',	'Winter',	10,	6);
-- select * from catalog;
-- select * from enroll;
-- select * from registration;
-- select * from student
