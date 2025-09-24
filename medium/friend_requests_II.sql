/*
Write a query to find the the people who has most friends and the most friends number. 
*/

with cte as
(
select
	requester_id as id,
	COUNT(1) as num
from
	leetcode602.request_accepted
group by
	requester_id
union all
select
	accepter_id as id,
	COUNT(1) as num
from
	leetcode602.request_accepted
group by
	accepter_id
),
cte1 as 
(
select
	id ,
	sum(num)
from
	cte
group by
	id
order by
	sum(num) desc 
)
 select
	id
from
	cte1
limit 1 ;