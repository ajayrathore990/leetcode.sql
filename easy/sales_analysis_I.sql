/*
Write an SQL query that reports the best seller by total sales price, 
If there is a tie, report them all.
*/

with cte as (
select
	seller_id,
	sum(price)
from
	leetcode1082.Sales
group by
	seller_id
)
select
	distinct seller_id
from
	cte
where
	sum = (
	select
		max(sum)
	from
		cte);


