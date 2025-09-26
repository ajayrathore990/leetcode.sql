/*
Write an SQL query to swap all 'f' and 'm' values 
*/

with cte1 as (
select
	*,
	case
		when sex = 'm' then 'F'
		else 'M'
	end as sex_
from
	leetcode627.Salary
)
select
	id,
	name ,
	sex_ ,
	salary
from
	cte1
;
