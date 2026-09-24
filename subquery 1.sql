use `awesome chocolates`;
select *
from sales
where Amount > (
select  avg(Amount)
from sales
);

select avg(amount)
from sales;

with avg_sales as (
select avg(amount) as avg_amount
from sales
)
select * from sales
where amount > (select avg(amount) from sales);

with sales_per_person as
(
select
spid,
sum(amount) as total_sales
from sales
group by SPID
),

avg_sales as (
select avg(total_sales) as avg_total_sales
from sales_per_person
)

select
p.salesperson,
spp.total_sales
from sales_per_person spp
join people p on spp.spid = p.spid
where spp.total_sales > (select avg_total_sales	from avg_sales);
