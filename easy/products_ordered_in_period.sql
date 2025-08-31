/*
Write an SQL query to get the names of products with greater than or equal to
100 units ordered in February 2020 and their amount.
*/

select
	p.product_name ,
	sum(unit) as unit
from
	leetcode1327.Orders o
join leetcode1327.Products p 
on
	p.product_id = o.product_id
where
	extract(month
from
	o.order_date) = 2
group by
	p.product_id
having
	sum(unit) >= 100;


