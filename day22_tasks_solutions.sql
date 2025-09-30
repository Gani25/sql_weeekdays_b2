-- Tasks
-- Set 1
drop database if exists shopdb;
create database shopdb;
use shopdb;
create table customers
(
 customer_id int primary key auto_increment,
 first_name varchar(50) not null,
 last_name varchar(50) not null,
 email varchar(50) unique not null, 
 phone varchar(50) unique not null,  
 city varchar(50),
 created_at date not null 
 );
 
create table products
 (
 product_id int primary key auto_increment,
 name varchar(50) not null,
 category varchar(50) not null,
 price decimal(10,2) not null check(price > 0),
 stock int not null check(stock >= 0)
);

 create table employees
 (
 employee_id int primary key auto_increment,
 first_name varchar(50) not null,
 last_name varchar(50) not null,
 city varchar(50) not null,
 role varchar(50) not null,
 hire_date date not null,
 salary decimal(10,2) not null check(salary > 0)
 );
 
 create table orders 
 (
 order_id int primary key auto_increment,
 customer_id int not null,
 product_id int not null,
 quantity int not null check(quantity > 0),
 order_date date not null,
 status varchar(20) not null,
 total decimal(10,2) not null check(total > 0),
 foreign key(customer_id) references customers(customer_id),
 foreign key(product_id) references products(product_id)
 );
 
 
 
insert into customers(first_name, last_name, email, phone,city, created_at) values
("Rohan", "Mehta", "rohan@gmail.com", 9876543210,  "Mumbai",  "2024-01-05"),
("Priya", "Sharma", "priya@gmail.com", 9123456780, "Pune",  "2024-01-10"),
("Aarav", "Patel", "aarav@gmail.com", 9988776655, "Surat",  "2024-02-15"),
("Neha",  "Singh", "neha@gmail.com", 9112233445, "Thane",  "2024-03-20"),
("Karan", "Desai", "karan@gmail.com", 9001122334, "Ahmedabad", "2024-04-01"),
("Ananya", "Iyer", "ananya@gmail.com", 9890011223, "Bengaluru", "2024-01-12"),
("Vivaan", "Kapoor", "vivaan@gmail.com", 9765432109, "Delhi", "2024-01-18"),
("Ishita", "Rao", "ishita@gmail.com", 9823456712, "Hyderabad", "2024-02-01"),
("Kabir", "Verma", "kabir@gmail.com", 9955443322, "Chennai", "2024-02-05"),
("Sanya", "Bajaj", "sanya@gmail.com", 9811223344, "Jaipur", "2024-02-12"),
("Aditya", "Nair", "aditya@gmail.com", 9797979797, "Kochi", "2024-02-18"),
("Tanya", "Gupta", "tanya@gmail.com", 9845012345, "Lucknow", "2024-03-01"),
("Aryan", "Chowdhury", "aryan@gmail.com", 9876501234, "Kolkata", "2024-03-05"),
("Meera", "Reddy", "meera@gmail.com", 9867891230, "Visakhapatnam", "2024-03-09"),
("Rahul", "Shetty", "rahul@gmail.com", 9898981212, "Mangalore", "2024-03-15"),
("Diya", "Malhotra", "diya@gmail.com", 9800112233, "Nagpur", "2024-03-22"),
("Sahil", "Chaturvedi", "sahil@gmail.com", 9700011223, "Bhopal", "2024-03-28"),
("Riya", "Agarwal", "riya@gmail.com", 9822113344, "Indore", "2024-04-03"),
("Arjun", "Menon", "arjun@gmail.com", 9966778899, "Trivandrum", "2024-04-07"),
("Pooja", "Joshi", "pooja@gmail.com", 9812345678, "Chandigarh", "2024-04-12"),
("Krish", "Shah", "krish@gmail.com", 9911223344, "Rajkot", "2024-04-18"),
("Sneha", "Banerjee", "sneha@gmail.com", 9753112233, "Howrah", "2024-04-25"),
("Rudra", "Ghosh", "rudra@gmail.com", 9833221144, "Durgapur", "2024-05-01"),
("Avni", "Khurana", "avni@gmail.com", 9798321456, "Patna", "2024-05-08"),
("Dev", "Kulkarni", "dev@gmail.com", 9888001122, "Nashik", "2024-05-15"),
("Mira", "Bhattacharya", "mira@gmail.com", 9844011223, "Siliguri", "2024-05-20"),
("Yash", "Mishra", "yash@gmail.com", 9789898989, "Varanasi", "2024-05-28"),
("Aditi", "Saxena", "aditi@gmail.com", 9723456123, "Kanpur", "2024-06-03"),
("Rohan", "Bose", "rohan.bose@gmail.com", 9911992233, "Guwahati", "2024-06-08"),
("Nisha", "Arora", "nisha@gmail.com", 9845567788, "Amritsar", "2024-06-15"),
("Veer", "Soni", "veer@gmail.com", 9733221144, "Jodhpur", "2024-06-20"),
("Lakshmi", "Swamy", "lakshmi@gmail.com", 9877561234, "Mysuru", "2024-06-25"),
("Parth", "Bhatt", "parth@gmail.com", 9767893210, "Surendranagar", "2024-07-01"),
("Ira", "Gill", "ira@gmail.com", 9888991122, "Ludhiana", "2024-07-06"),
("Samarth", "Chopra", "samarth@gmail.com", 9799001122, "Faridabad", "2024-07-12");
 
 
insert into products (name, category, price, stock) values
("Laptop", "Electronics", 55000.0, 15),
("Office Chair", "Furniture", 4500.0, 40),
("T-Shirt", "Clothing", 799.0, 100),
("Mixer Grinder", "Kitchen", 3200.0, 25),
("Cricket Bat", "Sports", 2500.0, 30),
("Smartphone", "Electronics", 32000.0, 25),
("Headphones", "Electronics", 2500.0, 60),
("Smartwatch", "Electronics", 12000.0, 40),
("Bluetooth Speaker", "Electronics", 4500.0, 50),
("Refrigerator", "Appliances", 48000.0, 10),
("Microwave Oven", "Appliances", 15000.0, 20),
("Washing Machine", "Appliances", 36000.0, 12),
("Air Conditioner", "Appliances", 42000.0, 8),
("Sofa Set", "Furniture", 25000.0, 10),
("Dining Table", "Furniture", 18000.0, 15),
("Bookshelf", "Furniture", 7500.0, 25),
("Bed Frame", "Furniture", 22000.0, 12),
("Formal Shirt", "Clothing", 1299.0, 80),
("Jeans", "Clothing", 1999.0, 70),
("Sneakers", "Clothing", 2999.0, 50),
("Jacket", "Clothing", 3499.0, 30),
("Pressure Cooker", "Kitchen", 2500.0, 40),
("Non-Stick Pan", "Kitchen", 1800.0, 60),
("Dinner Set", "Kitchen", 5200.0, 20),
("Water Purifier", "Kitchen", 15500.0, 15),
("Football", "Sports", 1200.0, 35),
("Badminton Racket", "Sports", 1800.0, 40),
("Tennis Ball Pack", "Sports", 600.0, 100),
("Dumbbells (Pair)", "Sports", 2200.0, 25),
("Novel Book", "Books", 499.0, 120),
("Cookbook", "Books", 699.0, 80),
("Children’s Story Book", "Books", 399.0, 150),
("Notebook Pack", "Books", 299.0, 200),
("Face Cream", "Beauty", 899.0, 70),
("Perfume", "Beauty", 2500.0, 40);



insert into employees(first_name, last_name,city, role, hire_date, salary) values
("Ankit", "Joshi","Mumbai", "Sales", '2023-01-15', 30000.00),
("Sneha", "Kapoor","Pune" ,"Delivery", '2023-02-10', 22000.00),
("Ramesh", "Iyer", "Mumbai", "Manager", '2023-12-01', 45000.00),
("Pooja", "Shetty","Thane","Support", '2023-03-20', 25000.00),
("Vishal", "Choudhary","Bengaluru", "Accountant", '2023-04-05', 28000.00),
("Aarav", "Mehta", "Nagpur","Sales", '2023-05-10', 31000.00),
("Nisha", "Rao","Mumbai", "Support", '2023-06-18', 24000.00),
("Karan", "Patel","Pune", "Manager", '2023-07-01', 47000.00),
("Ishita", "Nair","Pune", "Delivery", '2023-08-12', 21000.00),
("Rohit", "Singh","Thane", "Accountant", '2023-09-20', 29000.00),
("Tanya", "Sharma","Bengaluru", "Sales", '2023-10-15', 33000.00),
("Deepak", "Verma","Nagpur" ,"Support", '2023-11-05', 26000.00),
("Avni", "Desai","Mumbai", "Delivery", '2023-12-22', 22500.00),
("Sahil", "Chopra","Bengaluru", "Manager", '2023-05-25', 48000.00),
("Riya", "Ghosh","Mumbai", "Accountant", '2023-06-30', 27500.00),
("Manish", "Kulkarni","Mumbai", "Sales", '2023-07-18', 32000.00),
("Diya", "Agarwal","Mumbai", "Support", '2023-08-02', 25500.00),
("Kabir", "Bajaj", "Mumbai", "Delivery", '2023-09-10', 21500.00),
("Snehal", "Reddy","Mumbai", "Manager", '2023-10-28', 46000.00),
("Arjun", "Banerjee","Mumbai", "Accountant", '2023-11-12', 30000.00),
("Mira", "Chatterjee","Nagpur", "Sales", '2023-12-18', 34500.00),
("Rudra", "Malhotra","Pune", "Support", '2023-05-14', 27000.00),
("Lakshmi", "Swamy","Pune", "Delivery", '2023-06-08', 23000.00),
("Veer", "Khanna","Pune", "Manager", '2023-07-24', 49000.00),
("Priya", "Gill","Pune", "Accountant", '2023-08-19', 28500.00),
("Aryan", "Choudhury","Bengaluru", "Sales", '2023-09-05', 33500.00),
("Meera", "Joshi","Bengaluru", "Support", '2023-10-09', 26000.00),
("Samarth", "Saxena","Bengaluru", "Delivery", '2023-11-25', 22000.00),
("Ira", "Mishra","Bengaluru", "Manager", '2023-12-30', 45500.00),
("Dev", "Kulkarni","Mumbai", "Accountant", '2023-05-07', 29500.00),
("Ananya", "Kapoor","Mumbai", "Sales", '2023-06-16', 34000.00),
("Yash", "Menon","Mumbai", "Support", '2023-07-27', 25000.00),
("Sanya", "Bhatt","Mumbai", "Delivery", '2023-08-21', 23500.00),
("Krish", "Bose","Mumbai", "Manager", '2023-09-29', 47000.00),
("Neha", "Trivedi","Mumbai", "Accountant", '2023-10-13', 31000.00);


insert into orders(customer_id, product_id,quantity,order_date, status, total) values
(1, 1, 1, '2024-05-01', 'Delivered', 55000.00),
(2, 3, 2, '2024-05-02', 'Shipped', 1598.00),
(3, 5, 1, '2024-05-05', 'Pending', 2500.00),
(4, 2, 3, '2024-05-07', 'Delivered', 13500.00),
(5, 4, 2, '2024-05-08', 'Cancelled', 6400.00),
(6, 6, 5, '2024-05-09', 'Delivered', 22500.00),
(7, 7, 1, '2024-05-10', 'Shipped', 1800.00),
(8, 8, 2, '2024-05-11', 'Pending', 4200.00),
(9, 9, 1, '2024-05-12', 'Delivered', 5500.00),
(10, 10, 4, '2024-05-13', 'Cancelled', 12000.00),
(11, 11, 2, '2024-05-14', 'Delivered', 8800.00),
(12, 12, 3, '2024-05-15', 'Pending', 6000.00),
(13, 18, 1, '2024-05-16', 'Shipped', 1999.00),
(14, 15, 6, '2024-05-17', 'Delivered', 30000.00),
(15, 16, 2, '2024-05-18', 'Cancelled', 7000.00),
(16, 17, 1, '2024-05-19', 'Pending', 2500.00),
(17, 20, 4, '2024-05-20', 'Delivered', 18000.00),
(18, 21, 1, '2024-05-21', 'Shipped', 1598.00),
(19, 22, 2, '2024-05-22', 'Pending', 4000.00),
(20, 23, 3, '2024-05-23', 'Delivered', 13200.00);


use shopdb;

show tables;
select * from customers;
select * from employees;
select * from orders;
select * from products;


alter table orders
add employee_id int after customer_id;

-- add foreign key constraint 
alter table orders
add constraint foreign key (employee_id) 
references employees(employee_id);

show create table orders;

/*
Update Queries
*/
UPDATE `shopdb`.`orders` SET `employee_id` = '31' WHERE (`order_id` = '1');
UPDATE `shopdb`.`orders` SET `employee_id` = '8' WHERE (`order_id` = '2');
UPDATE `shopdb`.`orders` SET `employee_id` = '5' WHERE (`order_id` = '3');
UPDATE `shopdb`.`orders` SET `employee_id` = '4' WHERE (`order_id` = '4');
UPDATE `shopdb`.`orders` SET `employee_id` = '35' WHERE (`order_id` = '5');
UPDATE `shopdb`.`orders` SET `employee_id` = '34' WHERE (`order_id` = '6');
UPDATE `shopdb`.`orders` SET `employee_id` = '2' WHERE (`order_id` = '7');
UPDATE `shopdb`.`orders` SET `employee_id` = '6' WHERE (`order_id` = '8');
UPDATE `shopdb`.`orders` SET `employee_id` = '8' WHERE (`order_id` = '9');
UPDATE `shopdb`.`orders` SET `employee_id` = '10' WHERE (`order_id` = '10');
UPDATE `shopdb`.`orders` SET `employee_id` = '1' WHERE (`order_id` = '11');
UPDATE `shopdb`.`orders` SET `employee_id` = '1' WHERE (`order_id` = '12');
UPDATE `shopdb`.`orders` SET `employee_id` = '1' WHERE (`order_id` = '13');
UPDATE `shopdb`.`orders` SET `employee_id` = '2' WHERE (`order_id` = '14');
UPDATE `shopdb`.`orders` SET `employee_id` = '3' WHERE (`order_id` = '15');
UPDATE `shopdb`.`orders` SET `employee_id` = '21' WHERE (`order_id` = '16');
UPDATE `shopdb`.`orders` SET `employee_id` = '1' WHERE (`order_id` = '17');
UPDATE `shopdb`.`orders` SET `employee_id` = '2' WHERE (`order_id` = '18');
UPDATE `shopdb`.`orders` SET `employee_id` = '3' WHERE (`order_id` = '19');
UPDATE `shopdb`.`orders` SET `employee_id` = '17' WHERE (`order_id` = '20');
-- Set 1
-- 1. Find customers who joined in April 2024
select * from customers;
-- April = 4, Year = 2024
select *, monthname(created_at), 
year(created_at) 
from customers
where monthname(created_at) = "April" 
and year(created_at) = 2024;

select *
from customers
where monthname(created_at) = "April" 
and year(created_at) = 2024;

-- Show the total number of customers in each city
UPDATE `shopdb`.`customers` SET `city` = 'Mumbai' WHERE (`customer_id` = '10');
UPDATE `shopdb`.`customers` SET `city` = 'Mumbai' WHERE (`customer_id` = '14');
UPDATE `shopdb`.`customers` SET `city` = 'Pune' WHERE (`customer_id` = '17');
UPDATE `shopdb`.`customers` SET `city` = 'Nagpur' WHERE (`customer_id` = '19');
UPDATE `shopdb`.`customers` SET `city` = 'Nagpur' WHERE (`customer_id` = '21');
UPDATE `shopdb`.`customers` SET `city` = 'Thane' WHERE (`customer_id` = '23');
UPDATE `shopdb`.`customers` SET `city` = 'Pune' WHERE (`customer_id` = '25');
UPDATE `shopdb`.`customers` SET `city` = 'Mumbai' WHERE (`customer_id` = '27');
UPDATE `shopdb`.`customers` SET `city` = 'Mumbai' WHERE (`customer_id` = '29');
UPDATE `shopdb`.`customers` SET `city` = 'Mumbai' WHERE (`customer_id` = '31');
UPDATE `shopdb`.`customers` SET `city` = 'Pune' WHERE (`customer_id` = '33');
UPDATE `shopdb`.`customers` SET `city` = 'Bengaluru' WHERE (`customer_id` = '35');
UPDATE `shopdb`.`customers` SET `city` = 'Thane' WHERE (`customer_id` = '7');
UPDATE `shopdb`.`customers` SET `city` = 'Surat' WHERE (`customer_id` = '8');
UPDATE `shopdb`.`customers` SET `city` = 'Pune' WHERE (`customer_id` = '9');

UPDATE `shopdb`.`customers` SET `city` = 'Nagpur' WHERE (`customer_id` = '1');
UPDATE `shopdb`.`customers` SET `city` = 'Mumbai' WHERE (`customer_id` = '5');

select distinct city from customers;

select * from customers;
select city, count(*) total_customers from customers
group by city
order by total_customers desc;

-- List all orders with order_id, customer full name, 
-- product name, quantity, and total
-- 3 table join -> orders, customers, products
select  * from customers;
select  * from orders;
select  * from products;

select order_id, concat(first_name," ", last_name) full_name,
name product_name, quantity,price, price * quantity total_amount, total
from customers cust
join orders ord on cust.customer_id = ord.customer_id 
join products prd on ord.product_id = prd.product_id;

-- 4. Find products with price greater than the average price of all products

select * from products
where price > (select avg(price) from products);

-- 5. Show the top 2 cities with the highest number of orders

select * from customers;
select * from orders;


select * from customers c
join orders o on c.customer_id = o.customer_id;

select city, count(*) total_orders from customers c
join orders o on c.customer_id = o.customer_id
group by city
order by total_orders desc
limit 2;

