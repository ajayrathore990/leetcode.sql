/*
Write a query to find the overall acceptance rate of requests rounded to 2 decimals,
*/

with cte as (
select
	distinct requester_id,
	accepter_id
from
	leetcode597.request_accepted
),
full_count as (
select
	count(*)
from
	cte
),
friend_req as (
select
	count(*)
from
	leetcode597.friend_request
)
select
	cast((select count(*) from full_count) as decimal(10, 2)) / 
  nullif((select count(*) from friend_req), 0) as accept_rate;



