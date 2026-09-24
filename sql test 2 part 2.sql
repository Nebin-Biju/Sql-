-- aggregate  --

use sql_test_2;

select 	
sum(salary)
from Employee;

select 	
avg(salary)
from Employee;


select 	
max(salary)
from Employee;

select 	
min(salary)
from Employee;

select 	
count(EmployeeID)
from Employee;

select 	
count(EmployeeID)
from Employee
where Department = 'IT'
;

select 	
avg(Performancescore)
from Employee;

select 
max(Experience)
from Employee;

select 
sum(salary)
from Employee
where Department = 'Finance';

select 
avg(salary)
from Employee
where Experience > 3;

-- conditional --

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
when Performancescore >= 90 then 'Excellent'
when Performancescore between 80  and 90 then 'Good'
when Performancescore between 70  and 79 then 'Average'
else 'Needs Improvement'
end as ' employee_performance'
from Employee;

select *,
case
when Age >= 30 then 'Experienced'
when Age between 25  and 29 then 'Adult'
else 'Young'
end as ' AgeGroup'
from Employee;

select *,
case
when Salary >= 60000 then 'Eligible'
else ' Not Eligible  '
end as ' Bonus Eligibility'
from Employee;

select *,
case
when Experience >= 5 and Performancescore >=90 then ' Promotion Recommended '
when Experience >= 3 and Performancescore >=80 then ' Eligible for Review  '
else 'Not Eligible '
end as ' Promotion Status'
from Employee;



 



