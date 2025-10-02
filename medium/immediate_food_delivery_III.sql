/*
Write an SQL query to find the percentage of immediate orders on each unique order_date, 
rounded to 2 decimal places. 
*/

select
	order_date
       ,
	round(100 * SUM(if(customer_pref_delivery_date = order_date, 1, 0))/ COUNT(*), 2) as immediate_percentage
from
	leetcode2686.delivery
group by
	order_date
order by
	order_date;


