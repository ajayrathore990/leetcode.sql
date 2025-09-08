/*
Write an SQL query to report the number of users that are eligible for a discount.
*/

select
	count(1) as user_cnt
from
	leetcode2205.Purchases
where
	time_stamp between cast('2022-03-08' as date ) and cast('2022-03-20' as date )
	and amount > 1000;

