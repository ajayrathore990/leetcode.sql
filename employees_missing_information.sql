/*
Write a solution to report the IDs of all the employees with missing information. 
The information of an employee is missing if:
*/

select
	employee_id
from
	leetcode1965.employees
where
	employee_id not in (
	select
		employee_id
	from
		leetcode1965.Salaries)
union 
select
	employee_id
from
	leetcode1965.Salaries
where
	employee_id not in (
	select
		employee_id
	from
		leetcode1965.employees)
order by
	employee_id;


