/*
Write a query to find the shortest distance between two points in these points.
*/

select
	abs(min(minus)) as shortest
from
	(
	select
		x - lag(x) over() as minus
	from
		leetcode613.points
) xx;

