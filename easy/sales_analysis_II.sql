/*
Write an SQL query that reports the buyers who have bought S8 but not iPhone. 
Note that S8 and iPhone are products present in the Product table.

*/

select
	s.buyer_id
from
	leetcode1083.Sales s
join leetcode1083.Product p 
on
	s.product_id = p.product_id
where
	p.product_name not in (
	select
		p.product_name
	from
		leetcode1083.Sales s
	join leetcode1083.Product p 
on
		s.product_id = p.product_id
	where
		p.product_name <> 'S8'
);


