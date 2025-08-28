/*
Reports the products that were only sold in spring 2019. 
That is, between 2019-01-01 and 2019-03-31 inclusive. 
Select the product that were only sold in spring 2019.

*/

with cte as (
select
	*
from
	leetcode1084.Sales
where
	sale_date between cast('2019-01-01' as date) and cast('2019-03-31' as date)
)
select
	p.Product_id,
	Product_name
from
	cte c
join leetcode1084.Product p on
	c.Product_id = p.Product_id;


