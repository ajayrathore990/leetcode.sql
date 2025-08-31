/*
Write an SQL query to report the distance travelled by each user.
Return the result table ordered by travelled_distance 
*/

select
	u.name,
	sum(r.distance) as travelled_distance
from
	leetcode1407.Rides R
join leetcode1407.Users u
on
	R.user_id = u.id
group by
	u.id
order by
	sum(r.distance) desc;


