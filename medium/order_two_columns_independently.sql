/*
Write an SQL query to independently:
    1.order first_col in ascending order.
    2.order second_col in descending order.

*/

with col1 as 
(
select
	first_col ,
	second_col,
	row_number() over (
	order by first_col)
from
	leetcode2159.data
),
col2 as 
(
select
	second_col,
	first_col ,
	row_number() over (
	order by second_col desc)
from
	leetcode2159.data)
select
	c1.first_col,
	c2.second_col
from
	col1 as c1
join col2 as c2 
on
	c1.row_number = c2.row_number;


