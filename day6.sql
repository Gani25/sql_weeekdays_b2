-- day 6

-- DDL | DML
create database sprk_morning;
use sprk_morning;

-- Table

create table student
(
	roll_no int,
    first_name varchar(50),
    last_name varchar(50),
    gender varchar(10),
    percentage decimal(5,2)
);

select * from student;
describe student;

-- insert values in table 
insert into student values 
(10,"Shubham" ,"Shinde","Male",53.55);

select * from student;

insert into student(roll_no,first_name,gender,percentage)
values 
(1,"Pranjali" ,"Female",93.55);

select * from student;

insert into 
student(first_name,last_name,gender,roll_no,percentage) 
values 
("Anjali" ,"More","Female",2,62.88);

select * from student;

insert into student values 
(3,"Yuvraj" ,"Jangir","Male",65.00),
(5,"Rohit" ,"Sharma","Male",88.85),
(6,"Abdul" ,"Memon","Male",18.85);
insert into student values 
(3,"Yuvraj" ,"Jangir","Male",65.00),
(5,"Rohit" ,"Sharma","Male",88.85),
(6,"Abdul" ,"Memon","Male",18.85);

select * from student;

alter table student
add addmission_date datetime;

select * from student;