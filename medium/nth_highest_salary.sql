/*
Write a SQL query to get the nth highest salary from the Employee table.
-- n is integer and  nth highest salary and n = 2
*/

-- Solution 1
with cte as (
select
	*,
	rank() over(
order by
	salary)
from
	leetcode177.salary
)
select
	id
from
	cte
where
	rank = 2;

-- Solution 2

select
	id
from
	(
	select
		*,
		rank() over (
		order by salary)
	from
		leetcode177.salary) xx
where
	rank = n;