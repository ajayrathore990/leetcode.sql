/*
Write a SQL query that reports the device that is first logged in for each player.
*/

select
	player_id,
	device_id
from
	leetcode512.activity
where
	(player_id,
	event_date) in (
	select
		player_id,
		min(event_date)
	from
		leetcode512.activity
	group by
		player_id);


