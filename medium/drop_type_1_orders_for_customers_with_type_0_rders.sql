/*
Write an SQL query to report all the orders based on the following criteria:
If a customer has at least one order of type 0, do not report any order of type 1 
from that customer.
Otherwise, report all the orders of the customer.
*/

with
    cte as (
select
	distinct customer_id
from
	leetcode2084.Orders
where
	order_type = 0
    )
select
	*
from
	leetcode2084.Orders as o
where
	order_type = 0
	or not exists (
	select
		1
	from
		cte as t
	where
		t.customer_id = o.customer_id);


