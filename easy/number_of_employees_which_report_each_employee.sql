/*
Write an SQL query to report the ids and the names of all managers, 
the number of employees who report directly to them, 
and the average age of the reports rounded to the nearest integer.
*/


select
	e1.employee_id,
	name,
	reports_count,
	average_age
from
	(
	select
		reports_to as employee_id,
		count(distinct employee_id) as reports_count,
		round(avg(age)) as average_age
	from
		leetcode1731.Employees
	group by
		reports_to
	having
		reports_to is not null
    ) e1
left join leetcode1731.Employees e2
    on
	e1.employee_id = e2.employee_id
order by
	e1.employee_id;

