/*
Write an SQL query to find the percentage of the users registered in each contest 
*/

with cte as (
select
	count(contest_id) c1,
	contest_id
from
	leetcode1633.Register
group by
	contest_id
),
cte1 as (
select
	max(c1) as max
from
	cte
)
select
	cast(cast(c1 as float)/(select * from cte1) * 100 as float) as percentage,
	contest_id
from
	cte;


