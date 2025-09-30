/*
Write an SQL query to recommend pages to the user with user_id = 1 
using the pages that your friends liked. It should not recommend pages you already liked.
*/

with cte as 
(
select
	*
from
	leetcode1264.Friendship
where
	user1_id = 1
	or user2_id = 1
),
cte1 as 
(
select
	*
from
	leetcode1264.Likes
where
	user_id in (
	select
		user2_id
	from
		cte)
	or user_id in (
	select
		user1_id
	from
		cte)
)
select
	distinct page_id as recommended_page
from
	cte1
where
	user_id <> 1
order by
	page_id
;


