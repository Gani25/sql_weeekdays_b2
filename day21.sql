-- day 21
/*
1. create a procedure with first_name and last_name criteria
like
*/

select * from actor
where first_name like ("%A%") and last_name like ("%A%");

select * from actor
where first_name like "%A%" and last_name like "%A%"
order by first_name, last_name;
use sakila;

delimiter $

create procedure like_condition(
	f_name varchar(30), 
	l_name varchar(30)
)
begin
	select * from actor
    where first_name like concat("%",f_name,"%") and 
    last_name like concat("%",l_name,"%")
    order by first_name, last_name;
end $

delimiter ;

call like_condition("A","A");
call like_condition("AT","A");


-- sorting with sort column and directions (pagination)
-- pagenum, filter, sortcolumn, sortdir
use sprk_morning;

select * from employee;

select * from employee 
where 1 = 2
order by salary;
select "select * from employee order by salary";

delimiter $
drop procedure if exists sort_employee $
create procedure sort_employee(
	sort_column varchar(100),
	sort_dir varchar(30)
)
begin
	# call sort_employee("salary","ASC")
    # "select * from employee order by salary asc"
    if sort_dir is NULL or trim(sort_dir) = "" then
		set sort_dir = "ASC";
	end if;
    
    
	set @query = concat("select * from employee order by ",
		sort_column," ",sort_dir);
	prepare statement from @query;
    execute statement;
    
    deallocate prepare statement;

end $

delimiter ;

call sort_employee("salary","ASC");
call sort_employee("salary"); # ERROR
call sort_employee("salary","DESC");
call sort_employee("date_of_birth","ASC");
call sort_employee("date_of_birth","DESC");

call sort_employee("salary", null);
call sort_employee("salary", "");
call sort_employee("salary", "      " );
call sort_employee("emp_name", "      " );
