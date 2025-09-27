/*
Write an SQL query that reports the most experienced employees in each project. 
In case of a tie, report all employees with the maximum number of experience years.
*/

with cte as (
select
	project_id,
	max(experience_years)
from
	leetcode1077.Project p
join leetcode1077.Employee e 
on
	e.employee_id = p.employee_id
group by
	p.project_id
)
select
	p.project_id,
	e.employee_id
from
	leetcode1077.Project p
left join leetcode1077.Employee e on
	p.employee_id = e.employee_id
where
	(p.project_id,
	e.experience_years) in (
	select
		*
	from
		cte);

