/*
Write an SQL query that reports for each player and date, 
how many games played so far by the player. That is, 
the total number of games played by the player until that date. 
*/

select
	player_id,
	event_date,
	sum(games_played) over( partition by player_id
order by
	event_date) as games_played_so_far
from
	leeetcode543.Activity;

