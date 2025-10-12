/*
Write an SQL query to report the number of calls and the total call duration 
between each pair of distinct persons (person1, person2) where person1 < person2.
*/

with cte as 
(
select
	*,
	from_id + to_id as both_id
from
	leetcode1699.Calls
),
cte1 as 
(
select
	both_id,
	from_id ,
	to_id,
	sum (duration) over (partition by both_id ),
	count(duration) over (partition by both_id )
from
	cte
)
 select
	*
from
	cte1;

