/*
Write an SQL query that will, for each date_id and make_name, 
return the number of distinct lead_id's and distinct partner_id's.

*/

select
	date_id,
	make_name,
	count(distinct lead_id),
	count(distinct partner_id)
from
	leetcode1693.DailySales
group by
	make_name,
	date_id;
