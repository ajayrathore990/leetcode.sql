/*
Write an SQL query to find all active businesses.
An active business is a business that has more than one event type 
with occurences greater than the average occurences of that event type among all businesses.
*/

with cte as (
select
	business_id,
	avg(occurences),
	count(event_type)
from
	leetcode1126.Events
group by
	business_id
having
	count(event_type) >2 
)
select
	business_id
from
	cte
where
	avg >= (
	select
		avg(occurences)
	from
		leetcode1126.Events);
