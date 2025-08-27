/*
write a SQL query to output movies with an odd numbered ID 
and a description that is not 'boring'. Order the result by rating.
*/

select
	*
from
	leetcode620.cinema
where
	description not like '%boring%'
	and id %2 = 1;

