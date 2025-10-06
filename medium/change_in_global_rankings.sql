/*
Write an SQL query to calculate the change in the global rankings after 
updating each teams points.
*/

with
    P as (
select
	team_id,
	SUM(points_change) as delta
from
	leetcode2175.PointsChange
group by
	team_id
    )
select
	team_id,
	name,
	cast(rank() over (order by points desc, name) as SIGNED) - cast(
        rank() over (order by (points + delta) desc, name) as SIGNED
    ) as rank_diff
from
	leetcode2175.TeamPoints
join P
		using (team_id);
