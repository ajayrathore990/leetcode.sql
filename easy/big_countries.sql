/*
Write a SQL solution to output big countries name, population and area.
*/

select
	name,
	population,
	area
from
	leetcode595.World
where
	area > 3000000
	or population > 25000000;

