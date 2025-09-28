/*
Write an SQL query to find the average for daily percentage of posts that got removed 
after being reported as spam, rounded to 2 decimal places.
*/

with cte1 as(
select
	a.action_date,
	(COUNT(distinct r.post_id))/(COUNT(distinct a.post_id)) as result_
from
	(
	select
		action_date,
		post_id
	from
		leetcode1132.actions
	where
		extra = 'spam'
		and action = 'report') as a
left join
leetcode1132.removals r
on
	a.post_id = r.post_id
group by
	a.action_date
)
select
	(AVG(result_) * 100) average_daily_percent
from
	cte1;
