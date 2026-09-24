-- Arithmetic--- 

create database sql_test_2;
use sql_test_2;

create table Employee(
EmployeeID  int,
EmployeeName varchar(250),
Department varchar(250),
City varchar(250),
Salary int,
Experience int,
Age int,
Performancescore int
);

INSERT INTO Employee 
(EmployeeID, EmployeeName, Department, City, Salary, Experience, Age, Performancescore) 
VALUES
(101, 'Aarav', 'IT', 'Bangalore', 65000, 3, 25, 88),
(102, 'Diya', 'HR', 'Chennai', 45000, 2, 24, 72),
(103, 'Rahul', 'Finance', 'Mumbai', 70000, 5, 30, 91),
(104, 'Sneha', 'IT', 'Hyderabad', 55000, 4, 28, 85),
(105, 'Arjun', 'Sales', 'Delhi', 40000, 1, 23, 65),
(106, 'Meera', 'Finance', 'Chennai', 80000, 7, 34, 95),
(107, 'Kiran', 'IT', 'Bangalore', 62000, 6, 31, 89),
(108, 'Anjali', 'HR', 'Mumbai', 48000, 3, 27, 78);

select 
EmployeeName ,
salary ,
salary * 12 as 'annual_salary'
from Employee;

select 
EmployeeName,
salary ,
(salary * 10 / 100) + salary as 'bonus salary'
from Employee;

select 
EmployeeName,
salary + 5000 as 'Salary after Incentives'
from Employee;

select 
EmployeeName,
salary
from Employee;

select 
EmployeeName ,
salary ,
salary - (salary / 100 * 5) AS 'Salary after tax'
from Employee; 	

-- comparioson --

select 
EmployeeName 
from Employee
where salary >  60000;

select 
EmployeeName 
from Employee
where Experience < 3;

select 
EmployeeName 
from Employee
where age >=30;

select 
EmployeeName 
from Employee
where city != 'Chennai';

select 
EmployeeName 
from Employee
where Performancescore = 95;

select 
EmployeeName 
from Employee
where salary <= 50000;

select 
EmployeeName 
from Employee
where department = 'IT';

-- logical --

select 
EmployeeName 
from Employee
where salary >= 60000
and Experience >=5; 

SELECT * 
FROM Employee 
where department = 'IT' or department = 'Finance';

SELECT * 
FROM Employee 
where department != 'HR	';

use sql_test_2;

SELECT * 
FROM Employee 
where city = 'Bangalore'   and 
salary > 60000;

SELECT * 
FROM Employee 

where age > 25 and
Performancescore > 85 ;

SELECT * 
FROM Employee 
WHERE city = 'Chennai' OR city = 'Mumbai';

select * from 
Employee
WHERE city != 'Bangalore' ;

SELECT * 
FROM Employee 
WHERE Department = 'IT' OR Department = 'Finance'
and salary > 60000
;



 		