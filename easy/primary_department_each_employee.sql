/*
Write an SQL query to report all the employees with their primary department.
For employees who belong to one department, report their only department.
*/

select
	employee_id,
	deprtment_id
from
	leetcode1789.Employee
where
	deprtment_id in (
	select
		deprtment_id
	from
		leetcode1789.Employee
	where
		primary_flag = 'Y');

