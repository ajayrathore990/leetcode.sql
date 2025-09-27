/*
Write an SQL query that selects the product id, year, quantity, 
and price for the first year of every product sold.
*/

select
	product_id,
	year first_year,
	quantity,
	price
from
	leetcode1070.Sales
where
	(product_id,
	year) in (
	select
		product_id,
		MIN(year)
	from
		leetcode1070.Sales
	group by
		product_id);

