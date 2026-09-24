USE Titanic;
select count(*) as total_passengers
from train;

select count(Age) as total_age
from train;

select MIn(Age) as min_age
from train;

select Max(fare) as highfare
from train;

select avg(Age) as avg_age
from train;

select sum(FAre) as total_fare
from train;

select pclass,
Avg(age) as avg_ages
from train
group by Pclass;

Select sex,
count(*) as total_passs
from train
group by sex;