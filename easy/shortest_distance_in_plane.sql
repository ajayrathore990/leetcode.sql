/*
Write a query to find the shortest distance between these points rounded to 2 decimals.
*/

select
	min(sqrt((t1.x- t2.x)* (t1.x- t2.x) + (t1.y- t2.y) * (t1.y- t2.y))) as shortest
from
	leetcode612.point_2d t1
join leetcode612.point_2d t2
on
	t1.x != t2.x
	or t1.y != t2.y;
