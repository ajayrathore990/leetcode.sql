/*
Write an SQL query to fix the names so that only the
first character is uppercase and the rest are lowercase.
*/

select
	user_id,
	concat(upper(left(name, 1)),
lower(substring(name, 2))) as name
from
	leetcode1667.Users;

