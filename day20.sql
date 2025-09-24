-- stored procedures

/*
1. Store procedure consist of precompiled 
sql statements
2. SQL statements -> any type any number 
of statements
3. It can have parameters also.
*/

use sprk_morning;

drop procedure if exists select_tables;
-- Without Parameter
delimiter $

create procedure select_tables()
begin
	select * from employee;
    select * from department;

end $

delimiter ;

call select_tables();

-- in parameter 

delimiter $
drop procedure if exists filter_emp_by_department $
create procedure filter_emp_by_department(d_name varchar(30))
begin
	-- joins
    select emp.*, dept_name, location from employee emp
    join department dept on emp.dept_id = dept.dept_id
    where dept_name = d_name
    order by colmn_name;
end $

delimiter ;

call filter_emp_by_department("IT");
call filter_emp_by_department("Sales");
call filter_emp_by_department("Admin");
call filter_emp_by_department("HR");

use sakila;

select * from customer;

/*
1. create a procedure with first_name and last_name criteria
like
*/