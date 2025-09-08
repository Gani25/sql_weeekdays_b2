-- day 11
use sprk_morning;

create table my_table_one
(
	id int,
    data varchar(30)
);
insert into my_table_one values
(1,"One"),
(3,"Three-3"),
(5,"Five"),
(2,"Two-2"),
(10,"Ten"),
(6,"Six"),
(8,"Eight");

select * from my_table_one;


create table my_table_two
(
	id int,
    value varchar(30)
);
insert into my_table_two values
(3,"Three"),
(10,"Ten"),
(1,"One"),
(2,"Two"),
(15,"Fifteen"),
(19,"Nineteen"),
(25,"Twentyfive"),
(12,"Twelve"),
(14,"Fourteen");


select * from my_table_one;
select * from my_table_two;

-- Join / Inner Join
-- comparing by id
select * from my_table_one
join my_table_two
on my_table_one.id = my_table_two.id;

select * from my_table_one
join my_table_two
on my_table_one.id = my_table_two.id
order by my_table_one.id;

-- comparing by value 
select * from my_table_one
join my_table_two
on data = value;

-- rename column for better understanding
select my_table_one.id as T1ID, data as T1Data,
my_table_two.id as T2ID, value as T2Data
from my_table_one
join my_table_two
on my_table_one.id = my_table_two.id;

-- rename table to short name for easy accessibility for this particular
-- select query
select t1.id as T1ID, data as T1Data,
t2.id as T2ID, value as T2Data
from my_table_one as t1
join my_table_two as t2
on t1.id = t2.id;

-- we can remove as
select t1.id T1ID, data T1Data,
t2.id T2ID, value T2Data
from my_table_one t1
join my_table_two t2
on t1.id = t2.id;
