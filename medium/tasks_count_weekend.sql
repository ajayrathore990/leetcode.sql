/*
Write an SQL query to report:
The number of the tasks that were submitted during the weekend (Saturday, Sunday) 
as weekend_cnt, and
The number of the tasks that were submitted during the working days as working_cnt.
*/

with cte as 
(
select
	*,
	to_char(submit_date, 'TMDay') as cc
from
	leetcode2298.tasks
),
cte1 as
(
select
	*
from
	cte
where
	cc in ('Saturday', 'Sunday')
),
cte2 as
(
select
	*
from
	cte
where
	cc not in ('Saturday', 'Sunday')
)
select
	count(1) as non_week_nd
from
	cte1
union 
select
	count(1) as nweek_nd
from
	cte2;


