/*
Write a query to return the list of customers NOT referred by the person with id ‘2’.
*/

select
	name
from
	leetcode584.referee
where
	referee_id is null
	or referee_id <> 2;

