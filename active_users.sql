/*
Write an SQL query to find the id and the name of active users.
Active users are those who logged in to their accounts for 5 or more consecutive days.
*/

with cte as 
(
select
	*
from
	leetcode1454.Logins
order by
	id,
	login_date
),
cte1 as (
select
	*,
	lag(login_date) over()
from
	cte
),
cte2 as (
select
	*,
	case
		when login_date = lag + 1
		or login_date = lag then id
	end as _id
from
	cte1
)
select
	distinct c2.id as id ,
	name
from
	cte2 c2
join leetcode1454.Accounts a
on
	c2.id = a.id
where
	_id is not null;

