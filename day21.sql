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






