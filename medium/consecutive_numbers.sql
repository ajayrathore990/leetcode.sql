/*
Write an SQL query to find all numbers that appear at least three times consecutively.
*/

--Solution 1
--Subquery Scan on xx  (cost=88.17..132.62 rows=1264 width=32)
select
	ConsecutiveNums
from
	(
	select
		case
			when lag(Num) over (
			order by Id) = Num
			and Num = lead(Num) over (
			order by 
        Id) then Num
		end as ConsecutiveNums
	from
		leetcode180.Logs
        ) xx
where
	ConsecutiveNums is not null

--Solution 2
--CTE Scan on cte2  (cost=71.50..99.17 rows=1224 width=32)
with cte1 as (
select
	id,
	num ,
	lag (num) over() as lag1,
	lead(num) over() as lead1
from
	leetcode180.Logs
),
cte2 as 
(
select
	id,
	lag1,
	lead1,
	case
		when num = lag1
		and num = lead1 then num
		else 'XXX'
	end as ConsecutiveNums
from
	cte1
)
select
	ConsecutiveNums
from
	cte2
where
	ConsecutiveNums <> 'XXX';
