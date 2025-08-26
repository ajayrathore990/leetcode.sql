/*
write a SQL query to find the biggest number, which only appears once.
*/

select
	max(num)as num
from
	leetcode619.numbers
where
	num not in (
	select
		num
	from
		leetcode619.numbers
	group by
		num
	having
		count(num)>= 2
);




