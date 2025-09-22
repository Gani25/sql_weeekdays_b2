-- day 18

-- corelated subquery

use sprk_morning;
show tables;

select * from employee;

-- find all employees who earns more than average 
-- salary in their department

-- find avg salary in each dept
select dept_id, avg(salary) from employee
group by dept_id;
/*
# dept_id, avg(salary)
'1', '3500.0000'
'2', '2250.0000'
'4', '5250.0000'
'5', '4500.0000'
'8', '2000.0000'

*/

UPDATE `sprk_morning`.`employee` 
SET `salary` = '6000' WHERE (`emp_id` = '6');

select * from employee
where dept_id = 1;
select * from employee
where dept_id = 1 and salary > 3500;

select * from employee
where dept_id = 2 and salary > 2250;

-- tedious

-- corelated subquery

select * from employee e1
where salary >
	(
		select avg(salary) from employee e2
        where e2.dept_id = e1.dept_id
    );
    
explain analyze
select * from employee e1
where salary >
	(
		select avg(salary) from employee e2
        where e2.dept_id = e1.dept_id
    );

/*
select

from

join

on

where

group by

having

order by

limit
*/
select e1.*, dept_name, location from employee e1
join department d on e1.dept_id = d.dept_id
where salary >
	(
		select avg(salary) from employee e2
        where e2.dept_id = e1.dept_id
    )
order by salary;

select e1.*, dept_name, location from employee e1
join department d on e1.dept_id = d.dept_id
where salary >
	(
		select avg(salary) from employee e2
        where e2.dept_id = e1.dept_id
    )
order by salary;

-- FIND department where we don't have any employees


-- Views
/*
1. Views are Database Object 
2. Views are virtual table which is based on SQL Select statements.
*/


create view emp_with_dept 
as
select e1.*, dept_name, location from employee e1
join department d on e1.dept_id = d.dept_id
where salary >
	(
		select avg(salary) from employee e2
        where e2.dept_id = e1.dept_id
    )
order by salary;

select * from emp_with_dept;
