/* get the number of active users for the month of July. In this context, a monthly active user
is defined as a user who has performed at least one of the actions of signing in, liking, or commenting
in both the current month as well as the previous month.

This query utilizes a correlated subquery to obtain the desired results. Correlated subqueries compare each row
retrieved by the outer query to each row retrieved by the inner query, or subquery. The use of a 
correlated subquery in this case was necessitated by the requirement of tracking users active in 2 different months.
*/


select extract(month from current_month.event_date) as mth, count(distinct current_month.user_id) as monthly_active_users
from user_actions as current_month
where event_type in ('sign-in', 'like', 'comment') and extract(month from event_date) = 7 and exists (
  select last_month.user_id
  from user_actions as last_month
  where last_month.user_id = current_month.user_id
  and extract(month from last_month.event_date) = extract(month from current_month.event_date - interval '1 month'))
group by mth
