# Write your MySQL query statement below
with new as (
    select distinct case when monthname(sale_date) in ('December', 'January', 'February') then 'Winter' 
when monthname(sale_date) in ('March', 'April', 'May') then 'Spring' 
when monthname(sale_date) in ('June', 'July', 'August') then 'Summer' 
when monthname(sale_date) in ('September', 'October', 'November') then 'Fall' 
end as season,
category, sum(quantity) as total_quantity, sum(quantity*price) as total_revenue
from sales
join products using(product_id)
group by 1,2
order by 1,3 desc)

select season, category, total_quantity, total_revenue from
 (select *, dense_rank() over(partition by season order by total_quantity desc, total_revenue desc) as rn from new ) as n
where rn=1