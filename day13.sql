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

