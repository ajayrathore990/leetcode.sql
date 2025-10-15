/*
Write an SQL query to evaluate the boolean expressions in Expressions table.
Return the result table in any order.
*/

with cte as 
(
select
	e.left_operand,
	e.operator,
	e.right_operand,
	v.value as left_val,
	v_1.value as right_val
from
	leetcode1440.expressions e
join leetcode1440.variables v
on
	v.name = e.left_operand
join leetcode1440.variables v_1
on
	v_1.name = e.right_operand
)
select
	left_operand ,
	operator ,
	right_operand,
	case
		when operator = '=' then (left_val = right_val)
		when operator = '<' then (left_val < right_val)
		when operator = '>' then (left_val > right_val)
		else false
	end as
values
from
cte
;


