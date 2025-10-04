/*
Write an SQL query to rearrange the Genders table such that the rows alternate 
between 'female', 'other', and 'male' in order. The table should 
be rearranged such that the IDs of each gender are sorted in ascending order.
*/

with cte as 
(
select
	*,
	row_number() over(partition by gender)
from
	leetcode2308.Genders
),
cte1 as 
(
select
	*,
	rank() over(partition by row_number)
from
	cte
)
select
	user_id,
	gender
from
	cte1;


