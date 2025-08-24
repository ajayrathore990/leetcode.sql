/*
Write an SQL query to find all dates id with higher temperature compared to
its previous dates (yesterday).
*/

-------------
--solution 1
-------------
select
	id
from
	(
	select
		id ,
		temperature,
		lag(temperature) over () 
,
		case
			when temperature - lag(temperature) over() > 0 then id
		end as case1
	from
		leetcode197.Weather) xx
where
	case1 is not null;

-------------
--solution 2
-------------

with cte as (
	select
		*,
		case
			when temperature > lag(temperature) over()
then id
			else 0
		end as res
	from
		leetcode197.weather
)
select
	res as id
from
	cte
where
	res != 0;
