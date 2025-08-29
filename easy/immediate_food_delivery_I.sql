/*
Write an SQL query to find the percentage of immediate orders in the table, 
rounded to 2 decimal places.

*/

with cte as (
select
	count(*)
from
	leetcode1173.Delivery
),
cte1 as (
select
	count(*)
from
	leetcode1173.Delivery
where
	order_date = customer_pref_delivery_date
),
result as 
(
select
	cast((cast((select * from cte1) as float)/(select * from cte)) * 100 as float)
)
select
	float8 as immediate_percentage
from
	result;

