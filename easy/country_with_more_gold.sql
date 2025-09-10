/*
The country with more gold medals comes first.
If there is a tie in the gold medals, the country with more silver medals comes first.
If there is a tie in the silver medals, the country with more bronze medals comes first.
If there is a tie in the bronze medals, the countries with the tie are sorted in ascending order lexicographically.
Write an SQL query to sort the Olympic table

*/

select
	*
from
	leetcode2377.Olympic
order by
	gold_medals desc;


