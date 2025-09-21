/*
Write a SQL query to get the nth highest salary from the Employee table.
n=2

*/


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
