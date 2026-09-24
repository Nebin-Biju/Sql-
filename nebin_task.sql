create database practice1;

use practice1;

create table sales(
sale_id int primary key,
product_id  varchar(50),
quatinty_sold int,
sale_date date,
total_price DECIMAL(10, 2));

insert into sales (sale_id,product_id,quatinty_sold,sale_date,total_price)
values
(101, 'c12' , 10, '2025-11-13', 500.30),
(102,'c13',20,'2025-11-14',600.50),
(103,'c14',20,'2025-11-15',700.70),
(104,'c15',30,'2025-11-16',600.80),
(105,'c16',30,'2025-11-16',800.90);

create table products(
product_id  varchar(50),
product_name  varchar(100),
category   varchar(50),
unit_price DECIMAL(10, 2));

insert into products( product_id,product_name,category,unit_price)
values
('c12' ,'fan','electronics',50.10),
('c13' ,'mic','electronics',50.30),
('c14' ,'chair','furniture',30.50),
('c15' ,'scale','stationary',40.00),
('c16' ,'earphoe','electronics',50.25);


select product_name as products
from 
products;

select * 
from 
sales;

select 
product_name as products,
unit_price   as price_per_unit
from 
products;


select 
product_name as products
from 
products
where 
unit_price > 100 ;

select * 
from 
sales
where
quatinty_sold > 3;

select sum(quatinty_sold) as total_sold
from sales;

select sum(total_price) as sales_revenue
from sales;

select avg(unit_price) as avg_unit_price
from products;

-- JOIN Questions--

select
p.product_name,
s.quatinty_sold,
s.total_price
from sales s
left join products p on
p.product_id = s.product_id
;
select
p.product_name,
s.sale_date
from sales s
left join products p on 
p.product_id = s.product_id
;
select
p.product_name,
p.category,
quatinty_sold
from sales s
left join products p on 
p.product_id = s.product_id
;
select
p.product_name,
sum(s.quatinty_sold) as total_sold
from sales s
right join products p on 
p.product_id = s.product_id
group by
p.product_name
;
select
p.product_name,
sum(s.total_price) as total_revenue
from sales s
right join products p on 
p.product_id = s.product_id
group by
p.product_name
;

select
p.product_name,
sum(s.total_price) as total_revenue
from sales s
right join products p on 
p.product_id = s.product_id
group by
p.product_name
having total_revenue > 500
;

-- GROUP BY & HAVING--

SELECT product_id, 
SUM(total_price) AS total_sales_amount
FROM Sales
GROUP BY product_id;

SELECT 
p.product_name, 
SUM(s.quatinty_sold) AS total_quantity
FROM Sales s
JOIN Products p ON s.product_id = p.product_id
GROUP BY p.product_name;

SELECT 
p.product_name, 
avg(s.total_price) avg_amount
from sales s
JOIN Products p ON s.product_id = p.product_id
GROUP BY p.product_name;

SELECT 
p.product_name, 
sum(s.quatinty_sold) as quantity_sold
from sales s
 JOIN Products p
ON s.product_id = p.product_id
group by p.product_name
having quantity_sold > 4;

SELECT 
p.product_name, 
s.sale_date,
sum(s.total_price) as total_revenue
from sales s
join products p
ON s.product_id = p.product_id
group by s.sale_date,p.product_name
having total_revenue > 500;

-- ORDER BY -- 

SELECT * 
FROM products
ORDER BY 
unit_price DESC;

SELECT 
s.sale_id, 
p.product_name, 
s.sale_date, 
s.total_price
FROM Sales s
LEFT JOIN products p ON
s.product_id = p.product_id
ORDER BY 
s.total_price DESC;

SELECT 
p.product_name, 
s.sale_date, 
s.total_price
FROM Sales s
LEFT JOIN products p ON
s.product_id = p.product_id
ORDER BY 
s.total_price DESC;

SELECT 
p.product_name, 
SUM(s.quatinty_sold) AS total_quantity
FROM products p
JOIN Sales s ON 
p.product_id = s.product_id
GROUP BY p.product_id, p.product_name
ORDER BY
total_quantity DESC;

-- Subquery Questions --

select 
product_name ,
unit_price
from products
where (select MAX(unit_price) FROM products)
limit 1;

select
product_name 
from Products 
where product_id = (
select 
product_id 
from sales 
GROUP BY 
product_id 
ORDER BY 
SUM(total_price) DESC 
LIMIT 1
);
 
select 
product_name,
unit_price
from products
where unit_price >(
select avg(unit_price)
from Products);

select
product_name 
from Products 
where product_id in (
select product_id 
from Sales 
where quatinty_sold = (
select max(quatinty_sold) 
from Sales)
);

select
max(unit_price) as second_highest_price
from Products
where unit_price < (
select max(unit_price) 
from 
Products);

-- Real-World Interview Questions --

select 
product_id,
sum(total_price) as total_revenue
from sales
group by 
product_id
order by 
total_revenue desc
limit 1;

select product_name 
from products 
where product_id in (
select product_id 
from sales 
where quatinty_sold = (select max(quatinty_sold) from sales)
)
limit 1;

select 
sum(total_price) as electronics_revenue
from sales
where product_id in (
select
product_id 
from products 
where category = 'electronics'
);

select 
avg(total_price) as average_revenue
from sales;

select product_name, 
(select sum(total_price)
from sales 
where product_id = products.product_id) 
as total_revenue
from products
order by total_revenue desc
limit 3;

select 
product_name, 
((select sum(total_price)
 from sales s
 where
 product_id = p.product_id) - unit_price)as price_difference
from products p
order by price_difference desc
limit 1;

select 
product_name, 
(select count(sale_id) 
from sales s
where product_id = p.product_id) as transaction_count
from products p;

select product_name, 
(select 
 max(sale_date) 
 from sales
 where
 product_id = p.product_id) as latest_sale_date
from products p;
