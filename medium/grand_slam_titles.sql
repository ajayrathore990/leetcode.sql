/*
Write an SQL query to report the number of grand slam tournaments won by each player.
*/

with cte as 
(
select
	wimbledon as id
from
	leetcode1783.Championships
union all
select
	fr_open as id
from
	leetcode1783.Championships
union all
select
	us_open as id
from
	leetcode1783.Championships
union all
select
	au_open as id
from
	leetcode1783.Championships
),
cte2 as 
(
select
	count(id) as grand_slams_count,
	id
from
	cte
group by
	id 
)
select
	player_id,
	player_name,
	grand_slams_count
from
	leetcode1783.Players p
join cte2 ct 
on
	ct.id = p.player_id;

