/*
Write a SQL query to get the second highest salary from the Employee table.
*/

select
	max(salary) as SecondHighestSalary
from
	leetcode176.Salary
where
	salary < (
	select
		max(salary)
	from
		leetcode176.Salary);

-------------
--solution 2
-------------
select
	salary SecondHighestSalary
from
	(
	select
		*,
		rank() over (
	order by
		salary ) as rank
	from
		leetcode176.Salary
) xx
where
	rank = 2


