USE `awesome chocolates`;
select 
s.saledate,
pr.product,
pr.category,
s.boxes,
s.amount
from sales s 
inner join  products pr
on s.PID = pr.PID