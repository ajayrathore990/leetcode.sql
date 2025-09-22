/*
Write an SQL query that reports the fraction of players that logged in again on the 
day after the day they first logged in, rounded to 2 decimal places.
In other words, you need to count the number of players that logged in for 
at least two consecutive days starting from their first login date, 
then divide that number by the total number of players.
*/

with cte as (
select
	*
from
	leetcode550.Activity a
join leetcode550.Activity b 
on
	a.event_date = b.event_date + interval '1 day'
	and a.player_id = b.player_id
),
cte1 as (
select
	distinct count(player_id)
from
	leetcode550.Activity
)
select
	(
	select
		COUNT(*)::FLOAT
	from
		cte) / 
  (
	select
		COUNT(*)
	from
		cte1) as ratio;
