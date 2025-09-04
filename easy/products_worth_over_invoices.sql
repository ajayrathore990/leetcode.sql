/*
Write an SQL query that will, for all products, return each product name with 
total amount due, paid, canceled, and refunded across all invoices.
*/

select
	name,
	sum(rest) as rest,
	sum(paid) as paid,
	sum(canceled) as canceled,
	sum(refunded) as refunded
from
	leetcode1677.Invoice i
join leetcode1677.Product p
on
	i.product_id = p.product_id
group by
	name;


