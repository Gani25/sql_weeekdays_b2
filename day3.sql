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
-- and last_name ends with S
select * from actor;
