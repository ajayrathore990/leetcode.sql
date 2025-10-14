/*
Write an SQL query to report the difference between number of apples and oranges sold each day.
*/

with apple as 
(
select
	*
from
	leetcode1445.Sales
where
	fruit = 'apples'
),
orange as 
(
select
	*
from
	leetcode1445.Sales
where
	fruit = 'oranges'
)
select
	a.sale_date,
	a.sold_num - o.sold_num as diff
from
	apple a
join orange o on
	a.sale_date = o.sale_date;


