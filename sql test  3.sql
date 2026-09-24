create database sql_test3;
use sql_test3;

create table Customers(
CustomerID int,
CustomerName varchar(200),
City Varchar(200),
JoinDate DATE
);

INSERT INTO Customers (
CustomerID, CustomerName, City, JoinDate) 
VALUES
(101, 'Aarav', 'Bangalore', '2023-01-15'),
(102, 'Diya', 'Chennai', '2023-03-22'),
(103, 'Rahul', 'Mumbai', '2022-11-05'),
(104, 'Sneha', 'Hyderabad', '2024-02-10'),
(105, 'Arjun', 'Delhi', '2023-08-12');

CREATE TABLE Orders (
    OrderID INT ,
    CustomerID INT,
    ProductID VARCHAR(50),
    OrderDate DATE,
    Amount DECIMAL(10, 2)
);

INSERT INTO Orders
 (OrderID, CustomerID, ProductID, OrderDate, Amount)
 VALUES
(1001, 101, 'P101', '2024-01-12', 45000),
(1002, 102, 'P102', '2024-02-15', 1200),
(1003, 101, 'P103', '2024-03-10', 800),
(1004, 103, 'P104', '2024-04-08', 25000),
(1005, 104, 'P105', '2024-05-01', 1500);

CREATE TABLE Products (
    ProductID VARCHAR(50),
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    Price DECIMAL(10, 2)
);

INSERT INTO Products
 (ProductID, ProductName, Category, Price)
 VALUES
('P101', 'Laptop', 'Electronics', 45000),
('P102', 'Mouse', 'Accessories', 1200),
('P103', 'Keyboard', 'Accessories', 800),
('P104', 'Monitor', 'Electronics', 25000),
('P105', 'Printer', 'Office', 1500);

-- inner join--

