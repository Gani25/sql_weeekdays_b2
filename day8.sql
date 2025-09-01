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

insert into student(name,email,age) values
("Rohit Sharma","rhg12@gmail.com",25);
select *  from student;

-- foreign key	
drop table student;
drop table if exists student;

create table course
(
	cid int primary key auto_increment,
    cname varchar(50) not null,
    cinstructor varchar(50) not null,
    cprice int not null,
    cduration varchar(100) not null
);

describe course;

create table student
(
	roll_no int not null,
    name varchar(50) not null,
    phno varchar(15) not null,
    cid int,
    foreign key (cid) references course(cid)
);

describe student;

show create table student;