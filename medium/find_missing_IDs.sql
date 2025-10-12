/*
Write an SQL query to find the missing customer IDs. 
The missing IDs are ones that are not in the Customers table but are in 
the range between 1 and the maximum customer_id present in the table.
*/

select
	generate_series(1, (select max(customer_id) from leetcode1613.Customers)) as customer_id
except
select
	customer_id
from
	leetcode1613.Customers;


