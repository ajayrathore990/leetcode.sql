/*
Write a SQL query to find employees who have the highest salary in each of the departments.
For the above tables, your SQL query should return the following rows
(order of rows does not matter).
*/

with cte as (
select
	*
,
	rank() over(partition by departmentid
order by
	salary desc )
from
	leetcode184.employees
)
select
	d.name as Department,
	c.name as Employee,
	Salary
from
	cte c
join leetcode184.Department d 
on
	d.id = c.departmentid
where
	c.rank = 1;


