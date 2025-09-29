/*
Write an SQL query to find for each user, whether the brand of the second item (by date) 
they sold is their favorite brand. If a user sold less than two items, 
report the answer for that user as no.

*/
with cte as 
(
select
	*,
	row_number() over( partition by o.seller_id
order by
	o.order_date) as my_rank
from
	leetcode1159.Users u
join leetcode1159.Orders o 
on
	u.user_id = o.seller_id
join leetcode1159.Items i 
on
	o.item_id = i.item_id
),
cte1 as 
(
select
	*
from
	cte
where
	my_rank = 2
)
select
	distinct
u.user_id,
	case
		when u.favorite_brand = item_brand then 'yes'
		else 'no'
	end as n2d_item_fav_brand
from
	leetcode1159.users u
left join cte1 c 
on
	u.user_id = u.user_id;