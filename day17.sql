-- day 17
-- multi row subquery

use sprk_morning;

show tables;

select * from employee;

select distinct dept_id from employee;
select * from department;

-- find all employees who 
-- earns highest salary in their department
-- Combination = joins + subqueries

select * from employee;
update employee set salary = 5500
where emp_id = 9;

-- find highest salary in each department
select dept_id, max(salary) as top_salaried from employee
group by dept_id;

-- join to get deptname and location
select e.dept_id, max(salary) as top_salaried,
dept_name, location 
from employee e 
join department d on e.dept_id = d.dept_id
group by dept_id;

/*
dept_id		top_salaried
1				5000
2				2500
4				5500
5				4500
8				2000

*/

select * from employee
where 
dept_id = 1 and salary = 5000
or 
dept_id = 2 and salary = 2500;

select * from employee
where dept_id = 4 and salary = 5500;

-- in 
select * from employee
where (dept_id, salary) in	
	(
		select dept_id, max(salary) from employee
        group by dept_id
    );
    
-- subquery + join
SELECT 
    e.*, dept_name, location
FROM
    employee e
        JOIN
    department d ON e.dept_id = d.dept_id
WHERE
    (e.dept_id , salary) IN (SELECT 
            dept_id, MAX(salary)
        FROM
            employee
        GROUP BY dept_id)
;

-- Calculate Years of experience of employees
select emp_id,emp_name,salary,date_of_joining
, (year(now()) - year(date_of_joining)) year_exp,
date_of_birth
from employee;

-- find thos emp whose year_exp is more than 2
select emp_id,emp_name,salary,date_of_joining
, (year(now()) - year(date_of_joining)) year_exp,
date_of_birth
from employee
having year_exp > 2;

-- subquery in from clause 

SELECT 
    *
FROM
    (SELECT 
        emp_id,
            emp_name,
            salary,
            date_of_joining,
            (YEAR(NOW()) - YEAR(date_of_joining)) year_exp,
            date_of_birth
    FROM
        employee) emp_exp
WHERE
    year_exp > 2;


-- 1. find those employees whose age is greater than 26
-- 2. find employee create a column in resultset (select)
-- generated column age -> 22 years and 6 months