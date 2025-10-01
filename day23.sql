-- day 23 (Stored Procedures)

-- in parameter (Default)

-- out
use classicmodels;

select @name;
set @name = "SPRK";

select @name;

-- out parameter (procedure -> return)
select * from orders;
select distinct status from orders;
select count(*) from orders
where status = "Shipped";
select count(*) from orders
where status = "Disputed";
select count(*) from orders
where status = "Cancelled";
desc orders;
-- create a procedure
-- in - accept status varchar(15)
-- out - it should give count of that particular status

delimiter $

create procedure product_status_count
(
	product_status varchar(15),
    out product_count int
)
begin
	select count(*) into product_count 
    from orders
    where status = product_status;

end $

delimiter ;

call product_status_count("shipped",@shipped_count);
select @shipped_count;
call product_status_count("cancelled",@cancelled_count);
select @cancelled_count;
call product_status_count("disputed",@disputed_count);
select @disputed_count;
call product_status_count("resolved",@resolved_count);
select @resolved_count;
call product_status_count("On Hold",@on_hold_count);
select @on_hold_count;
call product_status_count("In Process",@in_process_count);
select @in_process_count;
select @shipped_count shipped_products, @cancelled_count,  @disputed_count,
@resolved_count, @on_hold_count, @in_process_count;

-- inout
select * from orders;
select count(*) from orders
where customerNumber = 128;
select count(*) from orders
where customerNumber = 145;

-- same type as input and same type we are getting as output 
-- inout

delimiter $

drop procedure if exists cust_count $
create procedure cust_count(
inout num int
)
begin
	select count(*) into num 
    from orders
    where customerNumber = num;
end $
delimiter ;

set @var = 128;

select @var;
call cust_count(@var);
select @var;

set @var = 145;

select @var;
call cust_count(@var);
select @var;
