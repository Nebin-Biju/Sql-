use sql_test3;

-- left join--

select 
c.customerid,
c.customername,
o.orderid,
o.orderdate
from customers c
left join  orders o
on c.customerid = o.customerid;

SELECT 
c.CustomerID, 
c.CustomerName
FROM 
Customers c
LEFT JOIN 
Orders o ON c.CustomerID = o.CustomerID
WHERE 
o.OrderID IS NULL;

SELECT 
c.CustomerName, 
o.OrderDate, 
o.Amount
FROM 
Customers c
LEFT JOIN 
Orders o ON c.CustomerID = o.CustomerID;

-- right join --

SELECT 
c.CustomerName, 
o.OrderDate, 
o.orderid,
o.Amount
FROM 
Customers c
RIGHT JOIN 
Orders o ON c.CustomerID = o.CustomerID;

-- full outerjoin--

SELECT 
c.CustomerID AS Customer_Table_ID ,
c.CustomerName, 
o.OrderID, 
o.CustomerID   AS Order_Table_ID,
o.OrderDate, 
o.Amount
FROM 
Orders o
RIGHT JOIN 
Customers c ON o.CustomerID = c.CustomerID;

select
c.customerId,
c.customerName,
o.orderID,
o.OrderDate
from
orders o
right join
Customers c on o.CustomerID = c.customerId
where 
o.OrderID is null
union

select
c.customerId,
c.customerName,
o.orderID,
o.OrderDate
from
Customers c
right join
orders o on o.CustomerID = c.customerId
where
c.CustomerID IS NULL;

 -- self join --
 
CREATE TABLE Employees (
EmployeeID INT PRIMARY KEY,
EmployeeName VARCHAR(50),
ManagerID INT
);
INSERT INTO Employees (EmployeeID, EmployeeName, ManagerID) VALUES
(101, 'Aarav', NULL),
(102, 'Diya', 101),
(103, 'Rahul', 101),
(104, 'Sneha', 102),
(105, 'Arjun', 10);


select 
e.EmployeeName as empname,
m.EmployeeName as manager
from Employees e
left join
Employees m ON e.ManagerID = m.EmployeeID;

select 
e.EmployeeName as empname
from Employees e
join
Employees m on e.ManagerId= m.EmployeeId
where
m.EmployeeName = 'Aarav';

select
m.EmployeeName as manager,
count(e.EmployeeID) as employeecount
from Employees e
join
Employees m on   e.ManagerId= m.EmployeeId 
group by
 m.EmployeeId,
 m.EmployeeName
 Having employeecount > 1 ;
 
select
c.customerid,
c.customername,
o.orderid,
o.amount
from 
customers c
join
orders o on c.customerid  = o.customerid
where
o.amount > (select avg(amount) from orders);

select
productid,
productname,
price
from products 
where 
price = (select max(price) from products);

SELECT 
CustomerID, 
CustomerName
FROM 
Customers
WHERE 
CustomerID IN (SELECT CustomerID FROM Orders);

select
productname,
productid,
price
from products
where 
productid not in (select productid from orders);

select
customerid,
customername
from customers
where customerid in(
select customerid
from orders
group by customerid
having sum(amount) > 30000);

select
max(price) as maxi
from products
where
price < (select max(price) from products);

select
customername,
customerid
from 
customers 
where customerid in (
select customerid
from orders
where productid in (
select productid
from products
where price = (select max(price) from products)
)
);

SELECT 
ProductID, 
ProductName, 
Price
FROM 
Products
WHERE 
Price > (SELECT AVG(Price) FROM Products);

select
(select current_date);

SELECT 
    (SELECT CURRENT_TIMESTAMP);
    
select
orderid,
customerid,
orderdate
from orders 
where 
year(orderdate) = 2024 ;

select 
customerid,
customername,
joindate
from customers
where 
joindate > '2023-01-01';

select 
customerid,
customername,
joindate
from customers
where customerid in 
(select customerid
from customers
where joindate > '2023-01-01');

SELECT 
OrderID, 
OrderDate, 
MONTH(OrderDate) AS OrderMonth
FROM 
Orders;

SELECT 
CustomerID,
 CustomerName, 
 JoinDate, 
	(SELECT YEAR(j.JoinDate)) AS JoinYear
FROM Customers j;

SELECT 
CustomerID, 
CustomerName, 
JoinDate,
(SELECT DATEDIFF
(CURRENT_DATE, c.JoinDate)) AS DaysSinceJoined
FROM 
Customers c;
    
SELECT 
OrderID, 
CustomerID, 
OrderDate, 
Amount
FROM 
Orders
WHERE 
OrderID IN (
SELECT OrderID 
FROM Orders 
WHERE YEAR(OrderDate) = 2024 
AND MONTH(OrderDate) = 4
);

SELECT 
CustomerID, 
CustomerName, 
JoinDate
FROM 
Customers
WHERE 
CustomerID IN (
SELECT CustomerID 
FROM Customers 
WHERE YEAR(JoinDate) = YEAR(CURRENT_DATE)
);

SELECT 
CustomerID, 
CustomerName, 
JoinDate,
(SELECT TIMESTAMPDIFF(MONTH, c.JoinDate, CURRENT_DATE)) AS MonthsRegistered
FROM 
Customers c;
    