/*
Given the Employee table, write a SQL query that finds out 
employees who earn more than their managers.
*/

select
	e.name as Employee
from
	leetcode181.employee e
join leetcode181.employee m 
on
	m.id = e.managerid
where
	e.salary > m.salary;


