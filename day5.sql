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

-- Find Sum of population in each continent
select * from country
where continent = "North America";


select continent, sum(population) as total_population 
from country where continent = "North America";
select continent, sum(population) as total_population 
from country where continent = "Asia";

select * from country
order by continent;

select continent, sum(population) from country
group by continent;

-- find number of countries in each continent
select continent, count(*) as num_of_countries from country
group by continent;

-- find number of countries in each continent 
-- where country count is more than 30

-- whenever we create column by formula or by functions ->
-- Generated columns
select continent, count(*) as country_count
from country
group by continent
having country_count > 30;

-- Find all countries where indepyear have null values
select * from country
where indepyear is null;

select * from country
where indepyear is not null;

-- in | not in 
-- between | not between

/*
TASK:
From sakila db
1. Count how many rentals have return_date as NULL.
2. ⁠Find how many addresses have postal_code missing (NULL).
3. ⁠Find the average length of films in each rating category where the average length is greater than 100 minutes.

From world db
1. Find the average life expectancy for each continent.
2. ⁠Find the minimum and maximum life expectancy for each continent.
*/