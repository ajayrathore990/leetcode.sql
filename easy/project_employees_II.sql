/*
Write an SQL query that reports all the projects that have the most employees.
*/

with cte as 
(
select
	project_id,
	count(employee_id) as e_count
from
	leetcode1076.Project
group by
	project_id
)
select
	project_id
from
	leetcode1076.Project
group by
	project_id
having
	COUNT(distinct employee_id) = (
	select
		MAX(e_count)
	from
		cte);
