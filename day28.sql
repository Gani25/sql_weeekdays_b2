-- TCL (DML)
/*
1. commit
2. rollback
3. savepoint
*/

-- automatically ON -> autocommit

set autocommit = false;

use sprk_morning;

show tables;

desc customer;

select * from customer;

delete from customer;

select * from customer;

rollback;

select * from customer;

start transaction;

insert into customer values
(20,"ROhan","Jadhav","2024-02-25", null);


select * from customer;

commit;

select * from customer;


start transaction;
insert into customer values
(21,"Abdul Gani","Memon","2025-11-26", null),
(22,"Shruti","Tambe","2020-05-15", null);

savepoint s1;

select * from customer;

update customer
set last_name = "Jain"
where cid = 7;


savepoint s2;

select * from customer;

delete from customer;

select * from customer;

rollback to s2;

select * from customer;

rollback to s1;

select * from customer;


select * from customer;

commit;

set autocommit = True;

-- show list of users

use mysql;

show tables;
select * from user;
select * from mysql.user;

-- create new user
create user rohit@localhost identified by "1234";



select * from mysql.user;

-- have to give privelleges
create database userDemo;
use userDemo;

grant all privileges on userDemo.* to rohit@localhost;

revoke all privileges on userDemo.* from rohit@localhost;

create table student
(
	id int primary key auto_increment,
    name varchar(50)
);


insert into student values(default,"Demo 1");
insert into student values(default,"Demo 2");
insert into student values(default,"Demo 3");
insert into student values(default,"Demo 4");

select * from student;

grant select on userDemo.student to rohit@localhost;

SHOW GRANTS FOR rohit@localhost;

revoke select on userDemo.student from rohit@localhost;


drop user rohit@localhost;

select * from mysql.user;