/*
Write an SQL query to replace the null values of drink with the name 
of the drink of the previous row that is not null. 
*/

with cte as 
(
select
	*,
	lead(drink) over() as lead_,
	lag(drink) over() as lag_
from
	leetcode2388.CoffeeShop
),
cte1 as 
(
select
	*,
	case
		when drink is null then lag_
		when drink is null then lead_
		else drink
	end answer
from
	cte
),
cte2 as 
(
select
	id,
	case
		when answer is null then lead_
		else answer
	end answer
from
	cte1
)
select
	*
from
	cte2;

