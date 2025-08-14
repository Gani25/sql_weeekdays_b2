-- day 2
-- Relational Operator (where)

use sakila;

select * from actor;
-- find all actor whose id is less than 10
select * from actor where actor_id < 10;

select * from actor where actor_id <= 10;

select * from actor where actor_id = 10;

select * from actor where actor_id != 10;

-- find all actor whose first_name is penelope
select * from actor
where first_name = "Penelope";

select * from actor
where first_name != "Penelope";

-- Logical Operator

-- find all actors whose first name is penelope and 
-- their id is less than 100
select * from actor
where first_name = "Penelope" and actor_id<100;

-- find all actors whos id is in range 20 to 30
-- >= 20 and  <= 30
select * from actor
where actor_id >= 20 and actor_id<=30;

-- find all actors from first_name list
-- ("Penelope","ED","Rohit","Adam")

select * from actor
where first_name = "Penelope" and
first_name = "ED" and
first_name = "Rohit"
and first_name = "Adam";

select * from actor
where first_name = "Penelope" or
first_name = "ED" or
first_name = "Rohit"
or first_name = "Adam";

select * from actor
where first_name = "Rohit"
or actor_id = 500;


select * from actor
where first_name = "Rohit"
or actor_id = 198;

select * from actor
where first_name = "Rohit"
and actor_id = 198;

-- find all actors whos id is in range 20 to 30
-- >= 20 and  <= 30
-- between 

select * from actor
where actor_id between 20 and 30;

-- find all actors whos id is in range 20 to 30
-- and their first_name is ED
select * from actor
where actor_id between 20 and 30 
and 
first_name = "ED" ;

select * from actor
where actor_id between 20 and 30 
or 
first_name = "ED" ;

-- find actor between 15 to 20 as well as 50 to 60
select * from actor
where actor_id between 15 and 20 
or actor_id between 50 and 60;

-- find actor between 15 to 20 as well as 50 to 60
-- as well as 2 to 5
select * from actor
where actor_id between 15 and 20 
or actor_id between 50 and 60
or actor_id between 2 and 5;

-- find all actors from first_name list
-- ("Penelope","ED","Rohit","Adam")
-- same column when we have to fetch values
-- in clause

select * from actor
where first_name = "Penelope" or
first_name = "ED" or
first_name = "Rohit"
or first_name = "Adam";

select * from actor
where first_name in ("penelope","ed","Rohit","adam");

