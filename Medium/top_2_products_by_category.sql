/* top 2 selling products in each category */

with totals as (
select category, product, sum(spend) as total_spend
from product_spend
where transaction_date between '2022-01-01' and '2022-12-31'
group by category, product
),

top_spend as 
(select *, dense_rank() over (partition by category order by total_spend desc) as ranking
from totals)

select category, product, total_spend
from top_spend
where ranking <= 2
