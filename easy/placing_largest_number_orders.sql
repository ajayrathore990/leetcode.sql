/*
Query the customer_number from the orders table 
for the customer who has placed the largest number of orders.
*/

-------------
--solution 1
-------------

select
	customer_number
from
	(
	select
		customer_number,
		count(customer_number) as cou
	from
		leetcode586.orders
	group by
		customer_number
	order by
		cou desc ) xx
limit 1 ;

-------------
--solution 2
-------------


with cte as
(
select
	count(customer_number) no_count,
	customer_number
from
	leetcode586.orders
group by
	customer_number
)
select
	customer_number
from
	cte
where
	no_count = (
	select
		max(no_count)
	from
		cte)
  ;
