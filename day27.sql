-- window functions more
use sprk_morning;

show tables;

create table train_timetable
(
	train_id int,
    station_name varchar(30),
    train_time time
);

select * from train_timetable;

insert into train_timetable values
(101, "Panvel","08:15:00"),
(102, "CST","7:00:00"),
(101, "Vashi","08:50:00"),
(101, "Kharghar","08:30:00"),
(101, "Seawoods Daravi","08:38:00"),
(102, "Chembur","7:55:00"),
(102, "Vadala","7:20:00"),
(102, "Vashi","8:15:00"),
(102, "Panvel","8:40:00"),
(101, "Vadala","09:20:00"),
(101, "Andheri","09:50:00"),
(101, "Bandra","09:30:00");

select * from train_timetable;
select distinct train_id from train_timetable ;



-- M indicator
-- IRCTC / Application -> Current time/ next station time

-- lead -> Next Value 
select *, lead(train_time) over (partition by train_id) as next_station_time
from train_timetable;

select *, lead(train_time) over (partition by train_id order by train_time) as next_station_time
from train_timetable ;

select *, 
lead(train_time) over (partition by train_id order by train_time) 
as next_station_time,
lead(station_name) over (partition by train_id order by train_time) 
as next_station
from train_timetable ;

select *, 
ifnull(
	lead(train_time) over(partition by train_id order by train_time),
	"Last Station"
)
next_station_time ,
ifnull(
	lead(station_name) over(partition by train_id order by train_time),
	"End Of Journey"
)
next_station
from train_timetable;

select * from train_timetable;

select *, 
ifnull(
	lag(train_time) over(partition by train_id order by train_time),
	"Journey Commence From Here"
)
previous_station_time ,
ifnull(
	lag(station_name) over(partition by train_id order by train_time),
	"Start of Journey"
)
previous_station
from train_timetable;


select *, first_value(station_name) over(partition by train_id order by train_time) 
as start_station,
last_value(station_name) over(partition by train_id ) 
as last_station
 from train_timetable;
 
 
select *, nth_value(station_name,3) over(partition by train_id) 
as station
 from train_timetable;
 
-- JSON Data Type

create table products
(
	product_id int primary key,
    name varchar(50),
    brand varchar(50),
    price decimal(12,2),
    properties json
);
alter table products 
modify product_id int auto_increment;
desc products;

insert into products(name,brand, price, properties) values
(
	"Amul Tonned Milk",
    "Amul",
    37,
    json_object(
		'Unit','450 ml',
        'Ingredients','Toned Milk,Fat 3% minimum ,SNF 8.5% minimum',
        'Qty In Stock','10' 
    )
);

select * from products;
insert into products(name,brand, price, properties) values
(
	"Quesla Oversized Men's T-shirt (Black)",
    "Quesla",
    389,
    '{
		"Color":"Black",
        "Gender":"Men",
        "Qty In Stock":50,
        "Fabric":"Cotton Blend"
	}'
);

select * from products;
 
