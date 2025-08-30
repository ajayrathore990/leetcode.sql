/*
Write an SQL query to find the average selling price for each product.
*/
select
	p.product_id ,
	cast(cast(sum(price * units)as float)/ cast(sum(u.units) as float) as float) as average_price
from
	leetcode1251.Prices p
join leetcode1251.UnitsSold u 
on
	p.product_id = u.product_id
where
	u.purchase_date between p.start_date and p.end_date
group by
	p.product_id;

