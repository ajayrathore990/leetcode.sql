/*
Output all the names in the table salesperson, 
who didn’t have sales to company ‘RED’.
*/

select
	name
from
	leetcode607.salesperson
where
	name not in (
	select
		s.name
	from
		leetcode607.orders o
	join leetcode607.salesperson s
on
		o.sales_id = s.sales_id
	join leetcode607.company c
on
		o.com_id = c.com_id
	where
		c.name = 'RED'
);


