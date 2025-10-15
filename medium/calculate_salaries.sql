/*
The tax rate is calculated for each company based on the following criteria.
*/

with cte as 
(
select
	* ,
	case
		when max(salary) over(partition by company_id ) < 1000 then 0
		when max(salary) over(partition by company_id ) between 1000 and 10000 then 24
		else 49
	end perc
from
	leetcode1468.Salaries
)select
	*,
	abs(((salary-perc)/ salary)* 100)
from
	cte;

