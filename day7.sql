-- day 7
use sprk_morning;

describe student;

drop table student;

show tables;

select now(), current_timestamp(), current_timestamp;

-- table with constraints
create table student
(
	roll_no int primary key auto_increment,
    name varchar(100) not null,
    email varchar(100) unique not null,
    age int not null check (age between 5 and 30),
    add_date datetime not null default current_timestamp
);

describe student;
insert into student(name,email,age) values
("Jay Krishna", "jay12@gmail.com",21);

select * from student;

-- ERROR UNIQUE CONSTRAINT FAILS
insert into student(name,email,age) values
("Jay Krishna", "jay12@gmail.com",21);

-- ERROR NOT NULL
insert into student(email,age) values
("jay12@gmail.com",21);

insert into student(name,email,age) values
("Prathamesh Katkar", "parthamesh12@gmail.com",28),
("Parth Jadhav", "parth20@gmail.com",15),
("Shubham Palande", "shubh20@gmail.com",30);

-- ERROR
insert into student(name,email,age) values
("Prathamesh Katkar", "parthamesh12@gmail.com",28),
("Parth Jadhav", "parth20@gmail.com",15),
("Shubham Palande", "shubh20@gmail.com",30);

select * from student;

insert into student(name,email,age) values
("Mihir Shinde", "mihir11@yahoo.com",28);

select * from student;

insert into student(roll_no, name,email,age) values
(30,"Mihir Yadav", "mihiryad11@yahoo.com",28);

insert into student( name,email,age) values
("Suyash Yadav", "suyash33@yahoo.com",12);

select * from student;
insert into student(roll_no, name,email,age) values
(2,"Memon Abdul Gani", "abdul1@yahoo.com",28);
select * from student;

insert into student(name,email,age) values
("Ajit Sharma", "ajit123@yahoo.com",5);
select * from student;

-- Error Code: 1062. Duplicate entry '2' for key 'student.PRIMARY'
insert into student(roll_no, name,email,age) values
(2,"Memon Abdul Gani", "abdul1@yahoo.com",28);

-- Error Code: 3819. Check constraint 'student_chk_1' is violated.

insert into student(name,email,age) values
("Ajit Sharma", "ajit1235@gmail.com",50);