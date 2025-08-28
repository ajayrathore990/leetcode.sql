/*
Write an SQL query to find the daily active user count for a period of 30 days ending 
2019-07-27 inclusively. A user was active on some day if he/she made at least one activity
on that day.
*/

select
	activity_date,
	count(distinct user_id) as active_users
from
	leetcode1141.Activity
where
	activity_date > '2019-06-26'
	and activity_date < '2019-07-27'
group by
	activity_date;


