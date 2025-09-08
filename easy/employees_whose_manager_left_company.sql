/*
Find the IDs of the employees whose salary is strictly less than $30000 and whose manager 
left the company. When a manager leaves the company,
their information is deleted from the Employees table, 
but the reports still have their manager_id set to the manager that left.

*/

select
	employee_id
from
	leetcode1978.employees
where
	manager_id not in (
	select
		employee_id
	from
		leetcode1978.employees)
	and salary <30000;


