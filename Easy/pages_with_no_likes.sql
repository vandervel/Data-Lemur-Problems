/* id's of Facebook pages that have not been liked. Two different solutions. */ 


-- using a subquery
select page_id
from pages
where page_id not in (select distinct page_id from page_likes)


-- using a left join

select p.pages_id
from pages p left join page_likes l as likes on p.page_id = likes.page_id
where likes.page_id is null

