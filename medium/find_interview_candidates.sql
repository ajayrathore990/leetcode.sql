/*
Write an SQL query to report the name and the mail of all interview candidates. 
A user is an interview candidate if at least one of these two conditions is true.
*/

with cte as 
(
select
	gold_medal as id
from
	leetcode1811.Contests
union all
select
	silver_medal as id
from
	leetcode1811.Contests
union all
select
	bronze_medal as id
from
	leetcode1811.Contests
)
select
	*
from
	cte c
join leetcode1811.Users u 
on
	c.id = u.user_id
;
