/* get number of companies that have made duplicate job postings */

with job_counts as (select company_id, title, description, count(job_id) as job_count
from job_listings
group by company_id, title, description)


select count(distinct company_id) as co_w_duplicate_jobs
from job_counts
where job_count > 1
