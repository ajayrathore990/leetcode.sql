/*
Write an SQL query to report the IDs of the users that are eligible for a discount.
Return the result table ordered by user_id.
*/

select
	user_id
from
	leetcode2230.Purchases
where
	time_stamp between cast('2022-03-08' as date ) and cast('2022-03-20' as date )
	and amount >1000
;
