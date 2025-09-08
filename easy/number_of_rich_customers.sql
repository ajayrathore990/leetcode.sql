/*
Write an SQL query to report the number of customers who had at least one bill 
with an amount strictly greater than 500.
*/

select
	count(distinct customer_id) as rich_count
from
	leetcode2082.Store
where
	amount >500
;

