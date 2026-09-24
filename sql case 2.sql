USE Titanic;
select case
when age <18 then 'child'
when age between 18 and 60 then 'adult'
else 'senior'
end as age_group,
count(*) as passenger_count
 from train
group by age_group;

select * from  train
where fare > ( 
select avg(fare)
from train);

select 
avg(fare) from train;

select name,pclass,fare,
rank() over(
partition by pclass
order by fare desc
) as fare_rank
from train;

select sex,
round(avg(survived) * 100,2) as survival_percent
from train
group by sex;

select name,
coalesce(age ,avg(age) over  ()) cl_age
from train;

select
case
when (sibsp + parch) = 0 then 'alone'
else 'family'
end as travel_type,

count(*)as total_passengers,
sum(survived) as survived_passengers,
round(sum(survived) * 100 / count(*) ,2) as survival_rate
from train
group by
case 
when(sibsp + parch) = 0 then 'alone'
else 'family'
end;

select pclass,
count(*) as passengers_count,
round(
count(*)  * 100 / (select count(*)  from train),
2
) as percentage_total
from train
group by pclass; 
