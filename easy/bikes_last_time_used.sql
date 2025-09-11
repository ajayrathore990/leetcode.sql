/*
Write an SQL query to find the last time when each bike was used.
*/

select
	bike_number
       ,
	MAX(end_time) as end_time
from
	leetcode2687.Bikes
group by
	bike_number
order by
	end_time desc;

