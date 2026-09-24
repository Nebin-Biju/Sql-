USE `awesome chocolates`;
select pr.category,
sum(s.amount) as total_sales
from sales s
join products pr
on s.pid = pr.pid
group by pr.category
order by total_sales desc; 

select p.salesperson,
sum(s.amount) as total_sales
from sales s
join people  p
on s.pid = p.spid
group by p.salesperson
order by total_sales desc;
 
USE `awesome chocolates`;
SELECT p.salesperson,
SUM(s.amount) AS total_sales
FROM sales s
JOIN people  p
ON  s.pid = p.spid
GROUP BY  p.salesperson
HAVING  SUM(s.amount) > 1000;

select 
g.region,
avg(s.amount)  as avg_amt
from sales s
join geo g
on s.geoid = g.geoid
where s.amount > 1000
group by g.region
having avg (s.amount) > 5000;

select
p.salesperson,
s.pid,
s.saledate,
row_number() over(
partition by p.salesperson
order by s.saledate)
as sales_order
from sales s
join people p
on s=spid = p.spid;


