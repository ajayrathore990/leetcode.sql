/*
Write an SQL query to reformat the table such that there is a department id column and 
a revenue column for each month.
*/

select 
	case
		when month = 'Jan'
	then revenue
	end as jan_rev,
	case
		when month = 'Feb'
	then revenue
	end as feb_rev,
	case
		when month = 'Mar'
	then revenue
	end as mar_rev
from
	leetcode1179.Department;


