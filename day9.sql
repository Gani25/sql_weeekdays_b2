-- day 9
use sprk_morning;
 
show tables;

desc course;

insert into 
course(cname,cinstructor,cprice,cduration)
values
("SQL","Mr S", 5000, "30 days"),
("Core Java","Mr J", 7500, "45 days"),
("Python","Mr S", 5000, "20 days"),
("Power BI","Mr P", 10000, "30 days"),
("Spring Boot","Mr J", 15000, "45 days");

select * from course;

desc student;

insert into student 
values
(1,"Ajit","1234",1);

select * from student;

-- ERROR BCOZ No COURSE with cid = 10
insert into student 
values
(2,"Shivani","8761",10);

-- ERROR COLUMN count is 4 and values are 3
insert into student 
values
(2,"Shivani","8761");

insert into student(roll_no,name,phno) 
values
(2,"Shivani","8761");

select * from student;

update student
set cid = 2 
where roll_no = 2;

select * from student;

-- Insert all the remaining students
insert into student values
(3,"Abdul","3315",3),
(1,	"Ajit","1234",3),
(1,	"Ajit","1234",4),
(2,	"Shivani", "8761",5),
(4,	"Shoaib", "1333",1);

select * from course;
select * from student;

alter table student
add gender varchar(10) after phno;

select * from student;
update student
set gender = "Male"
where roll_no in (1,3,4);

select * from student;
update student
set gender = "Female"
where roll_no = 2;

select * from course;
select * from student;

