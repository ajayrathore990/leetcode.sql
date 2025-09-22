/*
Write a SQL query that finds out managers with at least 5 direct report.
*/

with cte1 as 
(
select
	managerid,
	count(managerid) as mid_count
from
	leetcode570.employee
group by
	managerid
)
select
	name
from
	leetcode570.employee
where
	id = (
	select
		managerid
	from
		cte1
	where
		mid_count >= 5);


