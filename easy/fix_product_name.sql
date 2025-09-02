/*
Write an SQL query to report
product_name in lowercase without leading or trailing white spaces.
sale_date in the format ('YYYY-MM')
total the number of times the product was sold in this month.
*/

select
	trim(lower(product_name)) as product_name,	
	concat(extract (year from sale_date), '-', extract (month from sale_date)) as sale_date,
	count(product_name) as total
from
	leetcode1543.Sales
group by
	concat(extract (year from sale_date), '-', extract (month from sale_date))
,
	trim(lower(product_name))
order by
	count(product_name) desc;

