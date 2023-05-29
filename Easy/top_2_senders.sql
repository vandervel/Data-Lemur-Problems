/* 2 users who sent the most messages in August of 2022 */ 



select sender_id, count(message_id) as message_count
from messages
where date_part('year', sent_date) = 2022 and date_part('month', sent_date) = '08'
group by sender_id
order by message_count desc 
limit 2
