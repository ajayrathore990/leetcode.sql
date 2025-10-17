/*
Write an SQL query that reports for each player and date, 
how many games played so far by the player. That is, 
the total number of games played by the player until that date. 
*/

--Solution 1
--WindowAgg  (cost=0.00..105.78 rows=1770 width=12)
select
	player_id,
	event_date,
	sum(games_played) over( partition by player_id
order by
	event_date) as games_played_so_far
from
	leeetcode543.Activity;

--Solution 2
--CTE Scan on cte1  (cost=105.78..141.18 rows=1770 width=16)
with cte1 as (
select
	player_id,
	event_date,
	sum(games_played) over(partition by player_id
order by
	event_date)
games_played_so_far
from
	leeetcode543.Activity
) 
select
	*
from
	cte1;


