/*
Write a SQL query to find employees who have the highest salary in each of the departments.
For the above tables, your SQL query should return the following rows
(order of rows does not matter).
*/

--Solution 1

--Hash Join  (cost=116.78..144.00 rows=31 width=72)
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



--Solution 2

--CTE Scan on cte2  (cost=366.19..510.10 rows=6364 width=72)
with cte1 as (
select
	max(salary) over(partition by departmentid) as max_salary,
	*
from
	leetcode184.employees
),
cte2 as 
(
select
	e.id as e_id ,
	e.name as e_name,
	e.salary,
	e.departmentid,
	d.id as d_id,
	d.name as d_name,
	case
		when max_salary = salary then e.name
		else 'XXX'
	end as sol
from
	cte1 as e
join leetcode184.Department as d 
on
	e.departmentid = d.id 
)
select
	e_name,
	d_name,
	salary
from
	cte2
where
	sol <> 'XXX';
