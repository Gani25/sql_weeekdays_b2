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

-- Multi Level Sort
select * from actor
order by first_name; -- ASC
select * from actor
order by first_name desc;

-- sort first_name in desc but if repeated then sort
-- by actor_id in asc
select * from actor
order by first_name desc, actor_id;

select * from rental;

-- 1. Fetch the top 10 actors, sorted by last_name 
-- and then by first_name if last names are the same.

select * from actor
order by last_name, first_name 
limit 10;

-- 2. Display films ordered by length so the longest films come first.
select * from film
order by length desc;

-- 3. Show films sorted by replacement_cost (highest first), 
-- and if two films have the same cost, then sort by title.

select * from film 
order by replacement_cost desc, title;

-- 4. Display all rentals ordered by rental_date from newest to oldest.
select * from rental
order by rental_date desc;

-- How to find unique values from data set
use world;
show tables;
select * from country;
-- find all the continents
select continent from country;
select distinct continent from country;