/*
Write an SQL query to find for each date, the number of distinct products sold and their names.
The sold-products names for each date should be sorted lexicographically.
*/

select
	sell_date,
	COUNT(distinct product) as num_sold,
	array_to_string(array_agg(product), ',')as products
from
	leetcode1484.activities
group by
	sell_date
order by
	sell_date;


