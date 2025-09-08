/*
Write an SQL query to report the IDs of the low-quality problems. 
A LeetCode problem is low-quality if the like percentage of the problem 
(number of likes divided by the total number of votes) is strictly less than 60%.

*/

with cte as (
select
	*,
	likes / cast(likes + dislikes as float) * 100 per
from
	leetcode2026.Problems
)
select
	problem_id
from
	cte
where
	per<60
;

