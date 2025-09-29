/*
Write an SQL query to find the percentage of immediate orders in the first orders
of all customers, rounded to 2 decimal places.
*/

select
	ROUND(SUM(case when order_date = customer_pref_delivery_date then 1 else 0 end)/ count(distinct customer_id)* 100, 2) immediate_percentage
from
	leetcode1174.Delivery
where
	(customer_id,
	order_date) in
    (
	select
		customer_id,
		MIN(order_date)
	from
		leetcode1174.Delivery
	group by
		customer_id)