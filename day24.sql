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