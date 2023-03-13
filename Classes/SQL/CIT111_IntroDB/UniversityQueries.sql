#Query1
select college, count(college) from catalog group by college;
#Query2
select professor, regi_year, regi_term, capacity from registration
order by professor asc;
#Query3
select professor, regi_year, regi_term, count(enroll_id) from registration join enroll;
#Query4
select professor from registration group by year ('2017');
#Query5
select professor from registration group by year ('2016');
#Query6
select student_name, enroll_term,enroll_year, sum(credits) as credits from enroll as e
join student as s on s.student_id = e.student_student_id
join registration as r on r.registration_id = e.registration_registration_id
join catalog as c on registration_id = c.catalog_id
order by enroll_year, enroll_term, credits desc;
#Query7
select student_name, enroll_term,enroll_year, sum(credits) as credits from enroll as e
join student as s on s.student_id = e.student_student_id
join registration as r on r.registration_id = e.registration_registration_id
join catalog as c on registration_id = c.catalog_id
group by student_name
having credits > 3
order by regi_year, regi_term, credits desc;
#Query8
select student_name, dob from student  where month(dob)= 9;
#Query9
select student_name, datediff(year, current_date, dob) as years, 
datediff(day, current_date, dob) as days, concat(years'yrs', days'days')
