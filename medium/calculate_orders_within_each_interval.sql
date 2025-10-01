/*
Write a query to calculate total orders within each interval. 
Each interval is defined as a combination of 6 minutes.
*/

select
	'1' as interval_no,
	sum(order_count) as total_orders
from
	leetcode2893.orders
where
	minute <= 6
union all
select
	'2' as interval_no,
	sum(order_count) as total_orders
from
	leetcode2893.orders
where
	minute > 6 ;

