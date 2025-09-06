/*
Write an SQL query to convert each date in Days into a string formatted 
as "day_name, month_name day, year".
*/

select
	*,
	TO_CHAR(day, 'FMDay, FMMonth DD, YYYY')
from
	leetcode1853.day;

