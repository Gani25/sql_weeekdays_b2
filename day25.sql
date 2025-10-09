-- triggers
use sprk_morning;
show tables;
select * from customer;

-- Update Logic
alter table customer
add sign_up_at datetime default now();
alter table customer
add last_update datetime on update now();

select * from customer;

create table customer_records as
select * from customer;

select * from customer_records;
desc customer_records;

drop table customer_records;

create table customer_records like customer;

select * from customer_records;
desc customer_records;

insert into customer_records 
select * from customer;

select * from customer_records;

truncate table customer_records;

show create table customer_records;
alter table customer_records
modify  cid int ;
desc customer_records;
alter table customer_records
drop constraint `PRIMARY`;

desc customer_records;

alter table customer_records
modify sign_up_at datetime;

desc customer_records;

alter table customer_records
modify last_update datetime;

desc customer_records;
select * from customer_records;
alter table customer_records
add status varchar(50) after last_name;

show create table customer_records;

delimiter $

create trigger update_data
after update on customer
for each row
begin
	insert into customer_records values
    (old.cid,old.first_name, old.last_name, 
    "Before Update", old.sign_up_at, 
    old.last_update);
    
	insert into customer_records values
    (new.cid,new.first_name, new.last_name, 
    "After Update", new.sign_up_at, 
    new.last_update);
end $
delimiter ;

select * from customer;
update customer 
set first_name = "memon", last_name = "abdul gani"
where cid = 2;

select * from customer;
select * from customer_records;

drop trigger update_data;
drop trigger tr1;


/*
Indexing:
1. It is used to improve the speed of 
	search operations
2. Clustered Index: Primary Key -> BTREE
	Physically sort column in ASC
3. Non - Clustered Index
*/



show indexes from customer;
alter table customer
modify cid int;

alter table customer
drop constraint `primary`;

show indexes from customer;
create index idx1 on customer(first_name);
show indexes from customer;
desc customer;
alter table customer
modify cid int default null;
desc customer;
create unique index uniq_idx on customer(cid);

show indexes from customer;
desc customer;


create index uniq_idx on customer(cid);

select * from customer;
update customer set last_name = "gupta"
where cid = 7;
alter table customer
modify last_name varchar(30) primary key;

show indexes from customer;
desc customer;

select * from customer;

drop index uniq_idx on customer;
show indexes from customer;
desc customer;

drop index idx1 on customer;
show indexes from customer;
desc customer;

drop index `primary` on customer;

show indexes from customer;
desc customer;

select * from customer;