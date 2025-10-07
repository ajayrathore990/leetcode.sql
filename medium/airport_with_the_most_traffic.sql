/*
Write an SQL query to report the ID of the airport with the most traffic.
The airport with the most traffic is the airport that has the largest total number 
of flights that either departed from or arrived at the airport. 
If there is more than one airport with the most traffic, report them all.
*/

with cte as 
(
select
	departure_airport as id ,
	flights_count as cc
from
	leetcode2112.flights
union all
select
	arrival_airport as id ,
	flights_count as ss
from
	leetcode2112.flights
)
,
cte1 as (
select
	sum(cc),
	id
from
	cte
group by
	id
order by
	sum desc
)
select
	id
from
	cte1
where
	sum in (
	select
		max(sum)
	from
		cte1);


