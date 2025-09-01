-- day 8

-- Delete


use sprk_morning;

show tables;

select * from student;

delete from student
where roll_no = 28;

delete from student
where roll_no = 2;

delete from student
where roll_no in (1,30,9);

select * from student;
delete from student
where roll_no = 32;
select * from student;
-- next insrt -> autoincrement saved
insert into student(name,email,age) values
("Rohit Sharma","rhg12@gmail.com",25);

select * from student;

delete from student;

select * from student;
insert into student(name,email,age) values
("Rohit Sharma","rhg12@gmail.com",25);

select * from student;

truncate table student;
select * from student;
-- Foreign Key

insert into student(name,email,age) values
("Rohit Sharma","rhg12@gmail.com",25);
select *  from student;