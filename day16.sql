-- day 16 (Subquery)

use sprk_morning;

drop table if exists employee;

create table employee
(
	emp_id int primary key auto_increment,
    emp_name varchar(50) not null,
    phone varchar(15) not null unique,
    salary int not null,
    date_of_birth date not null,
    date_of_joining date not null,
    dept_id int not null
);


create table department
(
	dept_id int primary key ,
    dept_name varchar(50) not null,
    location varchar(50) not null
);

alter table department
modify dept_id int auto_increment;
desc department;
insert into department(dept_name, location)
values 
("HR","Airoli"),
("IT","Pune"),
("Sales","Airoli"),
("HR","Pune"),
("Admin","Thane"),
("Operations","Delhi"),
("Learning and Development","Pune"),
("Marketing","Bengaluru");

select * from department;

alter table employee
add constraint foreign key(dept_id) references 
department(dept_id);

show create table employee;

desc employee;
insert into employee values
(default,"Ayush Sharma","+91 12345 12345",2000,"1999-11-26","2022-05-25",2),
(default,"Shobit Jadhav","+91 12345 54321",5000,"1991-10-20","2020-01-20",4),
(default,"Jaya Vishwakarma","+91 54321 54321",2000,"1996-05-22","2021-10-20",8),
(default,"Memon Abdul Gani","+91 54321 12345",2000,"2001-09-10","2023-05-15",8),
(default,"Yash Ingale","+91 54321 87678",5000,"1999-05-25","2024-10-15",1),
(default,"Sahil Yadav","+91 87575 87678",1000,"2005-05-25","2025-02-10",1),
(default,"Dhondiba Shinde","+91 99999 87678",1500,"2002-05-25","2025-02-10",1),
(default,"Dev Shirke","+91 99999 88888",2500,"2001-10-20","2024-10-10",2),
(default,"Pranjal Gupta","+91 77777 88888",3500,"1995-05-25","2021-05-22",4),
(default,"Anjali Gupta","+91 66666 88888",4500,"1998-10-20","2022-05-23",5);

select * from employee;

-- Find all employees who earns more than average salary in organization
/*
1. Calculate Average Salary
2. Find All Employees where salary > average
*/

-- 1 Avg
select avg(salary) from employee;
-- current avg = 2900
-- 2. Find emp with salary more than 2900
select * from employee where salary > 2900;

insert into employee values
(default,"Salman Khan","+91 15151 12345",1500,"1985-05-20","2018-01-02",1);

-- 1 Avg
select avg(salary) from employee;
-- current avg = 2772.7273
-- 2. Find emp with salary more than 2772.7273
select * from employee where salary > 2772.7273;

/*
Here with above query we can solve problem but for particular instance of data
But when data will change our desired output will not come
*/

-- with subquery
select * from employee
where salary > (select avg(salary) from employee);

-- find all employees who earns highest salary in organization
-- max

select * from employee
where salary = (select max(salary) from employee);

-- Find all employees who earns 2nd highest salary in organization
-- 1. max() -> 5000
-- 2. Ignore above max -> find max() who is less than above max() < 5000

select * from employee 
where salary = (
		select max(salary) from employee 
		where salary < (
			select max(salary) from employee
            )
		);

-- Student approach
select * from employee
order by salary desc
limit 1 offset 1;




