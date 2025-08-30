/*
Write an SQL query to find number of comments per each post.
*/

select
	parent_id,
	count(distinct sub_id) as number_of_comments
from
	leetcode1241.Submissions
where
	parent_id is not null
group by
	parent_id;


