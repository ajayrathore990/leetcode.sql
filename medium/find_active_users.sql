/*
Write an SQL query thatll identify active users. An active user is a user that 
has made a second purchase within 7 days of any other of their purchases.
*/

with cte as 
(
select
	user_id,
	count(user_id)
from
	leetcode2688.users
group by
	user_id
having
	count(user_id) >= 2 
),
cte1 as 
(
select
	*
from
	leetcode2688.users
where
	user_id in (
	select
		user_id
	from
		cte)
),
cte2 as 
(
select
	*,
	lag(created_at) over( partition by user_id ) - created_at as days
from
	cte1
)
select
	user_id
from
	cte2
where
	extract (day
from
	days) >= 4;


