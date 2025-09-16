-- day 15

use classicmodels;

show tables;

select * from customers;
select * from orders;
select * from orderdetails;
select * from products;
select * from productLines;

select cust.customerNumber, customerName, 
concat(contactFirstName," ",contactLastName) contactName,
ord.orderNumber, orderDate, status,
quantityOrdered, priceEach,
pr.productCode, productName, productLine,buyPrice,MSRP, 
productVendor
from customers cust
join orders ord on cust.customerNumber = ord.customerNumber
join orderdetails orddtls on ord.orderNumber = orddtls.orderNumber
join products pr on orddtls.productCode = pr.productCode;


select cust.customerNumber, customerName, 
concat(contactFirstName," ",contactLastName) contactName,
ord.orderNumber, orderDate, status,
quantityOrdered, priceEach,
pr.productCode, productName, productLine,buyPrice,MSRP, 
productVendor
from customers cust
join orders ord on cust.customerNumber = ord.customerNumber
join orderdetails orddtls on ord.orderNumber = orddtls.orderNumber
join products pr on orddtls.productCode = pr.productCode
where cust.customerNumber = 128;

select * from orders
order by orderDate desc;


-- self join
-- empNumb, empFullName,empJobTitle, manager_id, manager_name, manager_title
select * from employees;