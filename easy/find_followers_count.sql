/*
Write an SQL query that will, for each user, return the number of followers.
*/

select
	user_id,
	count(follower_id) as followers_count
from
	leetcode1729.Followers
group by
	user_id;

