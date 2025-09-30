/*
Write an SQL query that selects the team_id, team_name and num_points 
of each team in the tournament after all described matches. 
Result table should be ordered by num_points (decreasing order). 
In case of a tie, order the records by team_id (increasing order).
*/

with cte as (
select
	case
		when host_goals > guest_goals then host_team
		when guest_goals < host_goals then guest_team
		else 100
	end as winning_team_,
	*
from
	leetcode1212.Matches m
join leetcode1212.Teams t 
on
	m.host_team = t.team_id
)
select
	*,
	count(winning_team_) over (partition by winning_team_ )
from
	cte;
