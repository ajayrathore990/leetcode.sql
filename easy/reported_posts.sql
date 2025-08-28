/*
Write an SQL query that reports the number of posts reported yesterday
for each report reason. Assume today is 2019-07-05.
*/

select
	extra as report_reason ,
	count(extra) as report_count
from
	leetcode1113.Actions
where
	action_date = cast('2019-07-04' as date)
	and extra is not null
group by
	extra;
