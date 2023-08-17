/* get the year-over-year growth rate for each product sold. Year-over-year
growth rate is calculated by the following formula:
    (current year's spending - previous year's spending / previous year's spending) * 100
*/


with yearly_spend as (

select extract(year from transaction_date) as yr, product_id, spend as curr_year_spend,
  lag(spend, 1) over (partition by product_id order by product_id, extract(year from transaction_date)) as prev_year_spend
from user_transactions 
)

select yr as "year", product_id, curr_year_spend, prev_year_spend,
round(100*((curr_year_spend - prev_year_spend)/prev_year_spend),2) as yoy_rate
from yearly_spend
order by yr
