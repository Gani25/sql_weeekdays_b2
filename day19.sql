-- views

use sprk_morning;

show tables;

select * from employee;
desc employee;


create view emp_view as
select emp_name,phone,salary,date_of_birth,date_of_joining,
dept_id from employee;


select * from emp_view;
-- DML with views
insert into emp_view values
("Shobit Gupta","+91 12121 12121",5000,"1985-10-25",
"2025-02-22",4);


select * from emp_view;
select * from employee;

create view emp_without_sal as
select emp_name, phone, 
date_of_birth, date_of_joining, dept_id
from emp_view;

select * from emp_without_sal;
select *,salary from emp_without_sal;

select * from employee;

UPDATE `sprk_morning`.`employee` 
SET `salary` = '10000' WHERE (`emp_id` = '3');


select * from emp_view;
drop view emp_view;

select * from emp_without_sal;
drop view emp_without_sal;

-- functions (Built in Function / User Defined Function)

-- String Functions
use sakila;

select * from actor;
select left("Abdul",1);

select *, left(first_name,1) as charac from actor;
select *, concat(left(first_name,2), 
left(last_name,1)) as sign from actor;

select *, left(first_name,1) as charac from actor;
select *, concat(right(first_name,3), 
right(last_name,1)) as sign from actor;

select upper("hello");
select lower("HelLo");

-- 1st string, 2nd start position of char 
-- and 3nd param num of characters
select substr("memon abdul gani",5,4);


select substr("memon abdul gani",5);

select ascii("A");
select ascii("Abdul");
select ascii("bdul");

select "    ABDUL GANI    ",
length("    ABDUL GANI    "),
trim("    ABDUL GANI    "),
length(trim("    ABDUL GANI    "));

select replace("Hello I am Abdul Gani","Abdul Gani","Sprk");

-- maths
select pi();
select abs(-50), abs(50);

select round(3.1518), round(3.6554);
select round(3.1588,2), round(3.6554,2);

select ceil(3.1222), ceil(-3.1222);
select floor(3.1222), floor(-3.1222);

select radians(90);
select degrees(1.5707963267948966);

select sin(1.5707963267948966);
select sin(radians(90));
select cos(radians(0));
select cos(radians(90));


-- date time functions
select now();

select adddate(now(),interval 15 day);
select adddate(now(),interval -15 day);
select adddate(now(),interval 1 month);
select adddate("1999-11-26",interval 1 month);
select subdate(now(),interval 15 day);

select addtime(now(), "1:00:00" );
select addtime(now(), "1:30:00" );

select now(),date_format(now(),"%d-%m-%y");
select now(),date_format(now(),"%d-%m-%Y %h:%i:%s %p");
select now(),date_format(now(),"%d-%m-%Y %r");
select now(),date_format(now(),"%d-%M-%Y %r");
select now(),date_format(now(),"%d-%c-%Y %r");
select now(),date_format(now(),"%d-%b-%Y %r");

select *, date_format(last_update,"%d-%b-%Y %r") from actor;
select *, date_format(last_update,"%D-%b-%Y %r .%f") from actor;