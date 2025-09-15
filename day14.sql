-- day 14

-- self join

use sprk_morning;

show tables;

create table employee
(
	eid int primary key,
    ename varchar(50) not null,
    reports_to int, -- only data avaialable in eid or null
    foreign key (reports_to) references employee(eid)
);

desc employee;
insert into employee(eid,ename) values
(1,"Amrit Parkar"),
(2,"John Simon"),
(3,"Nilesh Shinde"),
(4,"Abdul Memon"),
(5,"Pranjal Sharma"),
(6,"Nitin Deshmukh"),
(7,"Rohit Plande"),
(8,"Shoaib Khan"),
(9,"Anjali Gupta"),
(10,"Shoail Memon"),
(11,"Rajesh More");

select * from employee;
UPDATE employee SET reports_to = '3' WHERE eid = 1;
UPDATE `sprk_morning`.`employee` SET `reports_to` = '1' WHERE (`eid` = '2');
UPDATE `sprk_morning`.`employee` SET `reports_to` = '11' WHERE (`eid` = '4');
UPDATE `sprk_morning`.`employee` SET `reports_to` = '4' WHERE (`eid` = '5');
UPDATE `sprk_morning`.`employee` SET `reports_to` = '1' WHERE (`eid` = '6');
UPDATE `sprk_morning`.`employee` SET `reports_to` = '4' WHERE (`eid` = '7');
UPDATE `sprk_morning`.`employee` SET `reports_to` = '4' WHERE (`eid` = '8');
UPDATE `sprk_morning`.`employee` SET `reports_to` = '4' WHERE (`eid` = '9');
UPDATE `sprk_morning`.`employee` SET `reports_to` = '10' WHERE (`eid` = '11');


select * from employee;

-- self join(only 1 table ) but here also we can use inner and outer join

select * from employee e1
join employee e2
on e1.reports_to = e2.eid;

select e1.eid, e1.ename, 
e2.eid mid, e2.ename manager_name 
from employee e1
join employee e2
on e1.reports_to = e2.eid;

select e1.eid, e1.ename, 
e2.eid mid, ifnull(e2.ename,"Co Founder") manager_name 
from employee e1
left join employee e2
on e1.reports_to = e2.eid;

-- union -> 
/*
1. It is used to combine result set of 2 or more tables into single table
2. Column number should exactly match in all table
3. It removes repeated values and gives only unique values from both table
*/

select * from my_table_one;
select * from my_table_two;

select * from my_table_one
union
select * from my_table_two;

select id, data from my_table_one
union
select data,id from my_table_two;

-- ERROR
select id, data from my_table_one
union
select id from my_table_two;

-- union all

select * from my_table_one
union
select * from my_table_two;

select * from my_table_one
union all
select * from my_table_two;


select * from my_table_one
union all
select * from my_table_two
order by id;
-- to add condition or sorting alwas use first_table columns only

-- with union we achieve full outer join
-- full outer join = left join + right join

select * from my_table_one t1
left join my_table_two t2
on t1.id = t2.id
union
select * from my_table_one t1
right join my_table_two t2
on t1.id = t2.id;

-- reverse engineering (EER)