/*
Write an SQL query to find all the pairs of users with the maximum number 
of common followers. In other words, if the maximum number of common followers 
between any two users is maxCommon, then you have to return all pairs of 
users that have maxCommon common followers.
*/

with r as (
select
	r1.user_id as user1_id,
	r2.user_id as user2_id,
	count(*) as cnt
from
	leetcode1951.Relations r1
join leetcode1951.Relations r2
		using (follower_id)
where
	r1.user_id < r2.user_id
group by
	r1.user_id,
	r2.user_id)
select
	user1_id,
	user2_id
from
	r
where
	cnt = (
	select
		max(cnt)
	from
		r);
