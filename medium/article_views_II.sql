/*
Write an SQL query to find all the people who viewed more than one article on the same date,
sorted in ascending order by their id.
*/

select
	viewer_id
from
	leetcode1149.views
group by
	view_date,
	viewer_id
having
	count(distinct article_id)>1;


