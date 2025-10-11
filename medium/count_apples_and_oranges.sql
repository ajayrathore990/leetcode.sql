/*
Write an SQL query to count the number of apples and oranges in all the boxes. 
*/

with cte as 
(
select
	b.apple_count + coalesce(c.apple_count, 0) as AppleCount ,
	b.orange_count + coalesce(c.orange_count, 0) as OrangeCount
from
	leetcode1715.boxes as b
left join leetcode1715.chests as c on
	b.chest_id = c.chest_id)
select
	sum(AppleCount) as Total_Apples ,
	sum(orangecount) as Total_Oranges
from
	cte;


