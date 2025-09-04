/*
Write an SQL query to find the average time each machine takes to complete a process.
*/

with cte1 as (
select
	*
from
	leetcode1661.Activity
where
	activity_type = 'end'
), 
cte2 as (
select
	*
from
	leetcode1661.Activity
where
	activity_type = 'start'
)
select
	c1.machine_id,
	avg(c1.timestamp- c2.timestamp) as processing_time
from
	cte1 c1
join cte2 c2 on
	c1.machine_id = c2.machine_id
	and c1.process_id = c2.process_id
group by
	c1.machine_id
order by
	c1.machine_id;
