-- day 13
-- cross join

use sprk_morning;

show tables;

create table food_item
(
	item_name varchar(30),
    item_price int
);

insert into food_item values
("Dosa",60),("Burger",80),("Pizza",180),("Pav Bhaji",120);

select * from food_item;

create table toppings
(
	extra_item varchar(30),
    additional_price int
);

insert into toppings values
("Cheese",50),("Butter Cheese",80),("Sada",0),("Butter",40);

select * from food_item;
select * from toppings;

select * from food_item
cross join toppings;

select concat(extra_item," " ,item_name) menu, 
(item_price + additional_price) total 
from food_item
cross join toppings;


select concat_ws(" ",extra_item,item_name) menu, 
(item_price + additional_price) total 
from food_item
cross join toppings;

select * from toppings;

select concat_ws(" ",extra_item,item_name) menu, 
(item_price + additional_price) total 
from food_item
cross join toppings
order by item_name, total;


-- natural Join -> Create automatic condition on matching column name
/*
Inner
Outer
*/


select * from my_table_one;
select * from my_table_two;

-- id colm is repeated in both table so it is creating condition
-- only with id column
select * from my_table_one
natural join my_table_two;

alter table my_table_two
rename column value to data;

select * from my_table_two;

-- id and data both are same in both table
select * from my_table_one
natural join my_table_two;

select * from my_table_one
natural left join my_table_two;