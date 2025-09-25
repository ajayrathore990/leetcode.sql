/*
Please write a sql query to get the amount of each follower’s follower if he/she has one.
*/

select
	followee,
	count(followee) num
from
	leetcode614.follow
where
	followee in (
	select
		distinct follower
	from
		leetcode614.follow)
group by
	followee;


