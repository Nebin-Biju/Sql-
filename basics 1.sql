create database car_database;
use car_database;
CREATE TABLE cars_detail1 (
   `name` VARCHAR(40) NOT NULL,
   ` year` INT NOT NULL,
    `selling_price `INT NULL,
    `fuel` VARCHAR(45),
   ` sellingtype` VARCHAR(45) Default ' petrol',
    PRIMARY KEY (name, year)
);

alter table cars_detail1 add `cust_review` Varchar(50);
alter table cars_detail1 modify `fuel` varchar(200) Default ' petrol' ;
use car_database;
insert into
cars_detail1 
(name,year,selling_price,fuel,sellingtype) values
('raj',35,45,'disel','good');
use car_database;
insert into
cars_detail1 
(name,year,selling_price,fuel,sellingtype) values
('ram',35,45,'petrol','good');
use car_database;
update cars_detail1
set selling_price = 150
where name = 'ram' and year ='35';

use car_database;
delete from cars_detail1
where name = 'ram';
use car_database;
select * From cars_detail1;
select name
from `cars_detail1`;
