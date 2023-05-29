/* find the time elapsed between the first post made in 2021
and the last post made in 2021 for users who have posted at least twice in 2021 */


select user_id, (max(post_date::date) - min(post_date::date)) as days_between 
from posts
where date_part('year', post_date::date) = 2021
group by user_id
having count(post_id) > 1
