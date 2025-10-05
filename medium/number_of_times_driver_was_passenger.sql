/*
Write an SQL query to report the ID of each driver and the number of times 
they were a passenger.
*/

select
	D.driver_id,
	COUNT(R2.passenger_id) as cnt
from
	(
	select
		distinct R1.driver_id
	from
		leetcode2238.Rides R1) D
left join leetcode2238.Rides R2 on
	D.driver_id = R2.passenger_id
group by
	D.driver_id;
