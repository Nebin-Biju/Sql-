use `awesome chocolates`;

with product_sales as (
select
pr.pid,
pr.category,
sum(s.amount)  as total_sales
from sales s
join products	 pr
on s.pid = pr.pid
group by pr.pid,pr.category
),
category_avg as (
select
category ,
avg(total_sales) as avg_category_sales
from product sales 
group by category
)
select
ps.pid,
ps.category,
ps.total_sales
from product_sales ps
join category_avg ca
on ps.category = ca.category
where ps.total_sales > ca.avg_category_sales;


select 
    g.region,
    sum(s.amount) as total_sales
    from sales s
    join geo g
    on s.geoid = g.geoid
    group by g.region;
    
    with region_sales as (
    select
    g.region,
    sum(s.amount) as total_sales
	from sales s
    join geo g
    on s.geoid = g.geoid
    group by region
    ),
    
    company_avg as (
    select avg(total_sales) as avg_campany_sales
    from region_sales
    )
    
select
rs.region,
rs.total_sales
from  regional_sales rs
where rs.total_sales > (
select avg_company_sales from company_avg);
    