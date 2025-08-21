-- day 5

-- Aggregate Functions

use world;

show tables;
select * from country;
-- ERROR -> Invalid use of group by ..... 
select name, sum(population) from country;
select sum(population) as total_population from country;

-- find maximum population from world
select max(population) as maximum_population from country;
select * from country
where population = 1277558000; -- static fixed value 

-- ERROR
select * from country
where population = max(population);

select min(population) as min_pop from country;
select * from country where population = 0;

select count(population) as total_countries from country;

select count(indepyear) from country;
select count(*) from country;
select sum(population) as total_population, 
avg(population) as average_population
from country;

