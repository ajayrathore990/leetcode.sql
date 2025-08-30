/*
Write an SQL query to find the type of weather in each country for November 2019.
*/

with cte as (
select
	country_id,
	avg(weather_state) as avg_temp
from
	leetcode1294.Weather
where
	extract(month
from
	day) = 11
group by
	country_id
)
select
	country_name
			,
	case 
			when avg_temp <= 15 then 'Cold'
		when avg_temp >= 25 then 'Hot'
		else 'Warm'
	end as weather_type
from
	cte ct
join leetcode1294.Countries c 
on
	c.country_id = ct.country_id;

