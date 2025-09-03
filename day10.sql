-- day 10 (Many To Many)

use sprk_morning;

show tables;

drop table if exists student;
drop table if exists course;
show tables;

create table course
(
	cid int primary key auto_increment,
    cname varchar(100) not null,
    cinstructor varchar(100) not null,
    cprice int not null,
    cduration varchar(100) not null
);


-- Here I want auto increment to start from 1001
alter table course auto_increment = 1001;
desc course;
insert into course(cname,cinstructor,cprice,cduration) values
("Excel","Mr DA",5000,"45 hours"),
("Core Java","Mr J",10000,"90 hours"),
("Power BI","Mr DA",12000,"80 hours"),
("SQL","Mr DA",12000,"120 hours"),
("Spring Boot","Mr J",20000,"140 hours"),
("Python","Mr DS",15500,"50 hours");

select * from course;

create table student
(
	roll_no int primary key auto_increment,
    name varchar(100) not null,
    phone varchar(15) not null,
    gender varchar(20) not null
);
desc student;
-- modify column
alter table student
modify phone varchar(15) not null unique;

desc student;

insert into student (name,phone,gender) values
("Ajit Sharma","+91 12345 12345","Male"),
("Rohit Sharma","+91 87878 12345","Male"),
("Anjali Gupta","+91 99999 12345","Female"),
("Nandini Updahyay","+91 33333 12345","Female");

select * from student;
select * from course;

create table student_course
(
	transaction_id int primary key auto_increment,
    roll_no int not null,
    cid int not null,
    date_of_purchase datetime not null default current_timestamp
);
desc student_course;
show create table student_course;
-- alter
alter table student_course 
add constraint foreign key(roll_no) references student(roll_no);

alter table student_course 
add constraint foreign key(cid) references course(cid);

desc student_course;

show create table student_course;

select * from student;
select * from course;
select * from student_course;

insert into student_course(roll_no,cid) values
(1,1002),
(4,1005),
(1,1003),
(1,1001),
(3,1004),
(3,1001);
select * from student;
select * from course;
select * from student_course;
