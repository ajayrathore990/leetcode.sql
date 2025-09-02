/*
Write an SQL query to find the number of unique orders and the number of unique users
with invoices > $20 for each different month.
*/


select
	extract (month
from
	order_date) as month,
	count (distinct customer_id) as customer_count ,
	count (distinct order_id) as order_count
from
	leetcode1565.Orders
where
	invoice >20
group by
	extract (month
from
	order_date);


