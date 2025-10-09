/*
Write an SQL query to find the order_id of all imbalanced orders.
Return the result table in any order.
*/

with cte as 
(
select
	distinct order_id ,
	avg(quantity) over (partition by order_id) avg_by_id,
	(
	select
		avg(quantity)
	from
		leetcode1867.OrdersDetails) avg_totel
from
	leetcode1867.OrdersDetails
)
select
	order_id
from
	cte
where
	avg_totel < avg_by_id;


