/*
Write an SQL query that reports the average experience years of
all the employees for each project, rounded to 2 digits.
*/

select
	project_id,
	round(avg(e.experience_years), 2) average_years
from
	leetcode1075.Employee e
join leetcode1075.Project p
on
	e.employee_id = p.employee_id
group by
	p.project_id;


