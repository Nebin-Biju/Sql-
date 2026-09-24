
-- realtime--

use sql_test_2;

select 
EmployeeName,
(salary * 12) as annual_salary
from employee;

select * 
from employee
where salary > 60000;

select * 
from employee
where Department =  'IT' and
Experience > 3
;

select
avg(salary)
from employee;

select
max(salary) as highest_salary
from employee;

select
count(EmployeeID)
from employee;

select *,
case
when salary >= 70000 then 'High Salary'
when salary between 70000 and 69999 then 'Medium Salary'
else 'low salary'
end as ' salary_category'
from Employee;

select *,
case
when Experience >= 5 then 'Senior'
when Experience between 3  and 4 then 'Mid level'
else 'junior'
end as ' employee_category'
from Employee;

select *,
case
when Salary >= 60000 then 'Eligible'
when Salary between  40000  and 50000 then 'review'
else ' Not Eligible  '
end as ' Bonus Eligibility'
from Employee;

select * from
employee
order by salary  desc;


