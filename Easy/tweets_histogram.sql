/* create histogram of tweets where each group is defined by the number of tweets users have made. The number of 
users in each group is included */

select tweet_count as tweet_bucket, count(user_id) as users_num
from

(select user_id, count(tweet_id) as tweet_count
from tweets
where tweet_date between '2022-01-01' and '2022-12-31'
group by user_id) as total_tweets
group by tweet_count
