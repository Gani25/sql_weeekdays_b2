use sakila;

show tables;

use world;
show tables;

use sakila;
show tables;
-- select -> gives result set
select 5;

-- select * from table_name (syntax)
select * from actor;

select * from payment;
select * from customer;
select first_name, last_name from customer;

-- Arithmatic Operator

select 11*3 as multiply, 11/3 as division, 
11%3 as remainder, 11 div 3 as integer_division;

select * from film;
-- as -> aliases (just another name for column)
select film_id, title, rental_rate as rental_rate_usd,
rental_rate * 85 as rental_rate_inr from film;






