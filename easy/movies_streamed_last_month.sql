/*
Write an SQL query to report the distinct titles of the 
kid-friendly movies streamed in June 2020.
*/

select
	c.title
from
	leetcode1495.TVProgram tv
join 
leetcode1495.content c 
on
	tv.content_id = c.content_id
where
	kids_content = 'Y'
	and content_type = 'Movies'
	and extract(month
from
	tv.program_date) = 6;

