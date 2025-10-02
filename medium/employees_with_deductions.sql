/*
Write an SQL query to report the IDs of the employees that will be deducted. 
In other words, report the IDs of the employees that did not work the needed hours.
*/

with cte as 
(
select
	employee_id,
	sum(out_time- in_time) as time_sum_by_id
from
	leetcode2394.Logs
group by
	employee_id
),
cte1 as 
(
select
	*,
	e.employee_id as eeid
from
	cte c
right join leetcode2394.employees e 
on
	c.employee_id = e.employee_id 
),
cte2 as 
(
select
	extract (hour
from
	time_sum_by_id) >= needed_hours as values_,
	eeid
from
	cte1
),
cte3 as
(
select
	case
		when values_ is null then eeid
		when values_ is false then eeid
	end as result_id
from
	cte2
)
select
	*
from
	cte3
where
	result_id is not null;