-- question 1
select substr('Please find the substring in this string',instr('Please find the substring in this string','substring'), length('substring')) as parsed;
-- question 2
select abs(-25.76823) as 'abs',
       sign(-25.76823) as 'sign',
	   round(-25.76823) as 'round';
-- question 3
select extract(month from curdate()) as month;
-- question 4
SET @string := 'Sorcer''s Stone';
SELECT @string;
-- queston 5
set @string := '2024-02-29';
select date(@string) as "date";
select date_format(date(@string), '%d-%b-%y') as "date"


    
