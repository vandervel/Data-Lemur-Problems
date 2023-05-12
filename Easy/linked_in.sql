/* Get candidates that are proficient in all of Python, Tableau, and PostgreSQL. */


select candidate_id
from candidates
where skill in ('Python', 'Tableau', 'PostgreSQL')
group by candidate_id
having count(skill) = 3
order by candidate_id;
