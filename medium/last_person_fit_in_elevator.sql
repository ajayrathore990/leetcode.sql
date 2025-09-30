/*
Write an SQL query to find the person_name of the last person who will fit 
in the elevator without exceeding the weight limit. 
It is guaranteed that the person who is first in the queue can fit in the elevator.
*/

with cte as 
(
select
	*,
	sum(weight) over(
	order by turn) as r_sum
from
	leetcode1204.Queue
),
cte1 as 
(
select
	*
from
	leetcode1204.Queue
where
	turn in (
	select
		min(turn)
	from
		cte
	where
		r_sum >= 1000)
)
select
	person_name
from
	cte1;


