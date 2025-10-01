/*
Write a solution to report the number of passengers who successfully booked a flight (got a seat) 
and the number of passengers who are on the waitlist for each flight.
*/

with cte as (
select
	count(flight_id),
	flight_id
from
	leetcode2783.passengers
group by
	flight_id
)
select
	c.flight_id,
	capacity as booked_cnt,
	count- capacity as waitlist_cnt
from
	cte c
join leetcode2783.Flights f 
on
	f.flight_id = c.flight_id
;

