/*
Write an SQL query that will, 
for each user_id, find out the largest window of days between each visit and the 
one right after it 
(or today if you are considering the last visit).
*/

with cte as 
(
select
	*,
	case
		when lead(visit_date) over(partition by user_id) is null then '2021-1-1'
		else
lead(visit_date) over(partition by user_id)
	end as max_date_use
from
	leetcode1709.UserVisits
),
cte2 as 
(
select
	*,
	visit_date - max_date_use as maxx
from
	cte
)
select
	user_id,
	abs(max(maxx)) as biggest_window
from
	cte2
group by
	user_id
order by
	user_id
;

