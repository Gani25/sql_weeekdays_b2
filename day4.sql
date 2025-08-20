-- day 4

-- sorting -> order by clause
/*
1. ASCENDING -> DEFAULT
2. DESCENDING -> DESC
*/

use sakila;

select * from customer
order by customer_id; -- default ASC

select * from customer
order by customer_id desc;

select * from customer
order by customer_id;
select * from customer
order by store_id;

select * from customer
order by store_id desc;

