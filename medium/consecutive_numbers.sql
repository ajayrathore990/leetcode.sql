/*
Write an SQL query to find all numbers that appear at least three times consecutively.
*/

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
