/*
Write an SQL query to get the team_id of each employee that is in a team.
*/

with cte as 
(
select
	salary ,
	count(salary)
from
	leetcode1875.Employees
group by
	salary
having
	count(salary) <> 1
),
cte1 as 
(
select
	*
from
	leetcode1875.Employees
where
	salary in (
	select
		salary
	from
		cte) 
)
select
	*,
	dense_rank() over(
	order by salary)
from
	cte1;

