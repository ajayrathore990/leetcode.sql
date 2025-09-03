/*
Write an SQL query to report the names of all sellers who did not make any sales in 2020.
*/

select
	seller_name
from
	leetcode1607.Seller
where
	seller_name not in (
	select
		s.seller_name
	from
		leetcode1607.Orders o
	join leetcode1607.Customer c
on
		o.customer_id = c.customer_id
	join leetcode1607.Seller s 
on
		o.seller_id = s. seller_id
	where
		extract( year
	from
		o.sale_date) = 2020
);

