-- day 24
-- Stored Functions
/*
1. Block of sql statement which we can reuse again and 
again is called as stored functions
2. In MySQL functions are scalar functions
3. Scalar Functions -> Accepts multiple parameters
but always returns single value
*/

use classicmodels;

select * from customers;
select * from orders;

-- here we can create a function
/*
1. Accepts customerNumber (int) as input param
2. Returns ContactFullName (text)
*/

delimiter $
drop function if exists get_customer_contact_name $
create function get_customer_contact_name 
(customerNum int)
returns text
deterministic
begin

	declare customer_contact_name text;
    
    select concat_ws(" ",contactFirstName, contactLastName)
    into customer_contact_name from customers
    where customerNumber = customerNum;
    
    return customer_contact_name;
end $

delimiter ;

select get_customer_contact_name(103);
select get_customer_contact_name(447);
select get_customer_contact_name(363);

select * from orders;
select *, get_customer_contact_name(customerNumber) from orders;

select * from products;
select * from orderdetails;

select count(*) from orderdetails
where productCode = "S24_3969";

delimiter $

create function get_product_sold_count
(
product_code text
)
returns int
deterministic
begin
	declare sold_count int default 0;
    
    select count(*) into sold_count from orderdetails
    where productCode = product_code;
    
    return sold_count;

end $

delimiter ;

select get_product_sold_count("S24_3969");

select productCode, productName, MSRP, buyPrice, quantityInStock,
get_product_sold_count(productCode) product_sold
from products;

select productCode, productName, MSRP, buyPrice, quantityInStock,
get_product_sold_count(productCode) product_sold
from products
having product_sold = 0;

select * from 
(
select productCode, productName, MSRP, buyPrice, quantityInStock,
get_product_sold_count(productCode) product_sold
from products
) as sold_prods
where product_sold = 0;


-- Exception Handling
show tables;
select * from customers;
select * from orders;
select * from orderdetail;
select * from employees;
select * from offices;

delimiter $
create procedure handleException()
begin
	select * from customers;
	select * from orders;
	select * from orderdetail;
	select * from employees;
	select * from offices;
end $
delimiter ;


call handleException();

/*
Error Code: 1146 Table 'classicmodels.orderdetail' doesn't exist
1. Exit Handler
2. Continue Handler
*/

delimiter $
drop procedure if exists handleException $
create procedure handleException()
begin
	declare exit handler for 1146 
    select "Table Not Found" as message;
    
	select * from customers;
	select * from orders;
	select * from orderdetail;
	select * from employees;
	select * from offices;
	select * from payment;
end $
delimiter ;


call handleException();


delimiter $
drop procedure if exists handleException $
create procedure handleException()
begin
	declare continue handler for 1146 
    select "Table Not Found" as message;
	
	select * from customers;
	select * from orders;
	select * from orderdetail;
	select * from employees;
	select * from offices;
	select * from payment;
end $
delimiter ;


call handleException();

/*
Triggers
1. Special type of stored procedre which runs automatically when the 
DML(Insert, Update, Delete) operations is performed
Types of trigger
1. Before -> Insert, Update, Delete
2. After -> Insert, Update, Delete

// Two Keywords
1. new -> insert, update set
2. old -> delete, update db rows -> old
*/

use sprk_morning;

show tables;

select * from employee;
create table customer 
(
	cid int primary key auto_increment,
    first_name varchar(30) not null,
    last_name varchar(30) not null
) ;


insert into customer values
(default, "aYusH","meHTA"),
(default, "abdul","gani"),
(default, "PRANJALI","YADAV"),
(default, "Ashutosh","Verma");

SELECT 
    *
FROM
    customer;

insert into customer values
(default, "    Shoaib   ","    Khan    ");

select * from customer;

delimiter $

create trigger tr1
before insert on customer
for each row
begin
	
    set new.first_name = trim(new.first_name);
    set new.first_name = concat(
		upper(
			substring(new.first_name,1,1)
        ),lower(
			substring(new.first_name,2)
        ));
        
	set new.last_name = trim(new.last_name);
    set new.last_name = concat(
		upper(
			substring(new.last_name,1,1)
        ),lower(
			substring(new.last_name,2)
        ));

end $
delimiter ;

show triggers from sprk_morning;


insert into customer values
(default, "    Shoail   ","    Khan    ");


select * from customer;

insert into customer values
(default, "    ASHISH   ","    VerMA");


select * from customer;

-- update