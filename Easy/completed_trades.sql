/* top 3 cities by number of completed trades */

select city, count(order_id) as total_orders
from users u inner join trades t on u.user_id = t.user_id
where t.status = 'Completed'
group by city
order by total_orders desc 
limit 3
