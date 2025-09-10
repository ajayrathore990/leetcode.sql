/*
Write an SQL query to find the current salary of each employee assuming that salaries 
increase each year. Output their emp_id, firstname, lastname, salary, and department_id.
*/

with cte as (
select
	max(salary) as m_salary
from
	leetcode2668.Salary
group by
	emp_id
)
select
	distinct *
from
	leetcode2668.Salary
where
	salary in (
	select
		m_salary
	from
		cte
	order by
		emp_id
);

