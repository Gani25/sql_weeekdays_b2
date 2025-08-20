-- day 3
use sakila;

show tables;
/*
Like (wildcards) Pattern matching
% -> Means any characters and any length
_ -> Restrict length 
*/
select * from actor
where first_name like "%";
-- Find all actors whose first name start with A 
select * from actor
where first_name like "A%"; 

select * from actor
where first_name like "AL%"; 

-- first_name should end with A
select * from actor
where first_name like "%A"; 

select * from actor
where first_name like "A%T"; 

select * from actor
where first_name like "%A%"; 

select * from actor
where first_name like "%AL%"; 

-- Find all actors whose first name have only 4 characters
select * from actor
where first_name like "____";

select * from actor
where first_name like "A___";
select * from actor
where first_name like "A__M";

select * from actor
where first_name like "A__E%";

-- find actor with first name contains R at any place
-- and last_name ends with S -> 2conditions -true -> and
select * from actor
where first_name like "%R%" and last_name like "%S";

-- limit 
select * from actor
where actor_id <=5;
-- top 5 rows
select * from actor
limit 5;
select * from actor
limit 10;

-- limit / offset 
-- find actors between 10 to 20
select * from actor
limit 10 offset 10;

select * from actor
limit 5 offset 3;

select * from actor
limit 1 offset 1;

select * from customer;
/* 
find all customer whose id is in range 20 to 50 
as well as 100 to 145 and their first_name have A at any place
and their last name have LL at any place
*/

select * from film
where title like "%AFFAIR%" or title like "%DEVIL%" or title like "%FAMILY%";
/*
From sakila DB Use film table to solve questions
1. Find all films whose rental rate is more than 3
2. Find all films whose title contains DEVIL at any position or 
	title containes AFFAIR at any position or title have FAMILY at start.
3. Find all films whose ids are 10,30,100,1,990
4. Find all films whose length is more than 100 mins
5. find top 5 films
6. find 5 films skip first 5 rows
7. find films in range 25 to 30
8. Find films in range 60 to 70 as well as 100 to 105
*/

select * from customer;
select * from film;
/*
9. Fetch film_id, title, rental_rate column from film table and create 2 more column
	rental_rate in INR (1USD = 87.4 INR) (as in table it is mentioned in USD) 
    column Name will be retal_rate_INR and 
    with INR column add 18% Tax column name will bet rental_rate_inr_tax
*/