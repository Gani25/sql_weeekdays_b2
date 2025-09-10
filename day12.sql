-- Joins:
-- Outer Join
-- Left Outer Join

use sprk_morning;

show tables;

select * from my_table_one;
select * from my_table_two;

select * from my_table_one t1
left join my_table_two t2
on t1.id = t2.id;

select * from my_table_two t2
left join my_table_one t1
on t2.id = t1.id;

-- right  join


select * from my_table_one t1
right join my_table_two t2
on t1.id = t2.id;


-- Example of Join Implementation
select * from student;
select * from course;
select * from student_course;

-- Find Which student have bought which course
-- find complete detail

select * from student s
join student_course sc
on s.roll_no = sc.roll_no
join course c 
on sc.cid = c.cid;

select  transaction_id, s.*, date_of_purchase, c.* from student s
join student_course sc
on s.roll_no = sc.roll_no
join course c 
on sc.cid = c.cid;

select * from student s
join student_course sc
on s.roll_no = sc.roll_no;