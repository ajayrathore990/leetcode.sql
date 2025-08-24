/*
Write an SQL query that reports the first login date for each player.
*/

select
	player_id,
	min(event_date) as first_login
from
	leetcode511.activity
group by
	player_id
order by
	player_id;

