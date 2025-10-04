/*
Write an SQL query to report the day that has the maximum recorded 
degree in each city. If the maximum degree was recorded for 
the same city multiple times, return the earliest day among them.
*/

with cte as 
(
select
	*,
	max(degree) over(partition by city_id ) as max_degree
from
	leetcode2314.weather
),
cte1 as 
(
select
	*
from
	leetcode2314.weather
where
	degree in (
	select
		max_degree
	from
		cte)  
),
cte3 as
(
select
	max(day) day_,
	city_id
from
	cte1
group by
	city_id
)
select
	*
from
	leetcode2314.weather
where
	day in (
	select
		day_
	from
		cte3);

