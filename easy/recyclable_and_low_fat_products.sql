/*
Write an SQL query to find the ids of products that are both low fat and recyclable.
Return the result table in any order.
*/

select
	product_id
from
	leetcode1757.Products
where
	low_fats = 'Y'
	and recyclable = 'Y';



	