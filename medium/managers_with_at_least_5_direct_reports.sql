/*
Write a SQL query that finds out managers with at least 5 direct report.
*/

--Solution 1
--Seq Scan on employee  (cost=28.50..48.50 rows=4 width=32)
with cte1 as 
(
select
	managerid,
	count(managerid) as mid_count
from
	leetcode570.employee
group by
	managerid
)
select
	name
from
	leetcode570.employee
where
	id = (
	select
		managerid
	from
		cte1
	where
		mid_count >= 5);


--Solution 2
--Hash Join  (cost=69.58..98.58 rows=400 width=32)
select
	Name
from
	leetcode570.employee
where
	id in
(
	select
		ManagerId
	from
		leetcode570.employee
	group by
		ManagerId
	having
		COUNT(distinct Id) >= 5
    )

--Solution 3
--HashAggregate  (cost=176.00..178.50 rows=200 width=64)

select
	e.name
from
	leetcode570.employee e
join leetcode570.employee r
on
	e.id = r.managerid
group by
	e.name
having
	count(r.name) = 5;


