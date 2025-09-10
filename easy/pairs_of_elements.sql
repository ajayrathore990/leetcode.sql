/*
Write an SQL query to find all the pairs of elements that can form a bond.
*/

select
	E1.symbol as metal,
	E2.symbol as nonmetal
from
	leetcode2480.Elements as E1,
	leetcode2480.Elements as E2
where
	E1.type = 'Metal'
	and E2.type = 'NonMetal';


