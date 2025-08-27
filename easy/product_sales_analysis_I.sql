/*
Write an SQL query that reports all product names of the products in the Sales table 
along with their selling year and price.
*/

select
	p.product_name,
	s.year,
	s.price
from
	leetcode1068.Sales s
join leetcode1068.Product p
on
	p.product_id = s.product_id;

