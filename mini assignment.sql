use sql_test3;

select
c.CustomerID,
p.ProductName,
o.orderDate,
o.Amount from
customers c
join orders o on
c.CustomerID = o.CustomerID
join products p
ON o.ProductID = p.ProductID;

select
c.customerid,
c.CustomerName,
o.orderDate
from customers c
left join 
orders o on c.CustomerID = o.CustomerID
where o.OrderID is null;

select
c.customerid,
c.customername,
p.productname
from customers c
join
orders o  on c.CustomerID = o.CustomerID
join
products p on o.ProductID = p.ProductID
where 
p.Category = 'Electronics';

select
c.customername,
(select max(o.amount) from
orders o 
where o.CustomerID = c.CustomerID) as totalspent
from customers c 
where c.CustomerID =(
select CustomerID
from orders
group by CustomerID
order by sum(Amount) desc
limit 1
);

SELECT 
p.ProductID, 
p.ProductName, 
p.Category, 
p.Price
FROM 
Products p
LEFT JOIN 
Orders o ON p.ProductID = o.ProductID
WHERE 
o.OrderID IS NULL;

select
OrderID, 
CustomerID, 
ProductID, 
OrderDate, 
Amount
FROM 
Orders
where
orderdate in (
select orderdate
from orders
where year(OrderDate) = 2024
);

select
OrderID, 
CustomerID, 
ProductID, 
OrderDate, 
Amount
FROM 
Orders
WHERE YEAR(OrderDate) = 2024;

SELECT 
    CustomerID, 
    CustomerName, 
    JoinDate,
    DATEDIFF(CURDATE(), JoinDate) AS DaysRegistered
FROM 
    Customers;

SELECT 
    CustomerID, 
    CustomerName, 
    JoinDate
    from customers
    where joindate in ( select joindate
    from customers 
    where joindate> '2023-01-01');

 SELECT 
    CustomerID, 
    CustomerName, 
    JoinDate
    from customers
    where joindate> '2023-01-01';

create index index_cust_id
on  orders (customerid);



