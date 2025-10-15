/*
Write an SQL query to find the countries where this company can invest.
*/

with t1 as(
select
	caller_id as id,
	duration as total
from
	(
	select
		caller_id,
		duration
	from
		leetcode1501.calls
union all
	select
		callee_id,
		duration
	from
		leetcode1501.calls) a
)
select
	name as country
from
	(
	select
		distinct avg(total) over(partition by code) as avg_call,
		avg(total) over() as global_avg,
		c.name
	from
		((
		select
			*,
			coalesce(total, 0) as duration,
			SUBSTRING(phone_number from 1 for 3) as code
		from
			person
		right join t1
				using (id)) b
	join country c
on
		c.country_code = b.code)) d
where
	avg_call > global_avg
