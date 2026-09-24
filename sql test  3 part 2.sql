use sql_test3;

SELECT 
 c.CustomerName,
 p.ProductName,
 o.OrderDate,
 o.amount
 
 from customers c
 inner join 
 orders o on c.CustomerID = o.CustomerID
 inner join 
 products p on p.ProductID = o.ProductID;

SELECT 
c.CustomerName, 
c.City, 
p.ProductName
FROM 
Customers c
INNER JOIN 
Orders o ON c.CustomerID = o.CustomerID
INNER JOIN 
Products p ON o.ProductID = p.ProductID;
    
SELECT 
c.CustomerName, 
p.ProductName, 
p.Category 
from customers c

inner join 
Orders o on  c.CustomerID = o.CustomerID
INNER JOIN 
Products p ON o.ProductID = p.ProductID
where 
p.Category = 'Electronics';

select
c.customername,
p.productname,
p.price
from customers c
inner join 
Orders o on  c.CustomerID = o.CustomerID
INNER JOIN 
Products p ON o.ProductID = p.ProductID;

select
c.customername,
sum(o.amount) as total_amount
from customers c
inner join 
orders o on  c.CustomerID = o.CustomerID
INNER JOIN 
Products p ON o.ProductID = p.ProductID
group by c.CustomerName
;


 
 
