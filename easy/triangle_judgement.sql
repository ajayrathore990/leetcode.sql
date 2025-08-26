/*
writing a query to 
judge whether these three sides can form a triangle, 
assuming table triangle holds the length of the three sides x, y and z.
*/

select
	x,
	y,
	z,
	case
		when x + y > z
		and y + z > x
		and z + x > y then 'YES'
		else 'NO'
	end as triangle
from
	leetcode610.triangle;


