/*
Given a table tree, id is identifier of the tree node and p_id is its parent node’s id.
*/

select
	t1.id,
	case
		when t1.p_id is null then 'Root'
		when MAX(t2.id) is null then 'Leaf'
		else 'Inner'
	end as type
from
	leetcode608.tree as t1
left join leetcode608.tree as t2
on
	t1.id = t2.p_id
group by
	t1.id,
	t1.p_id
order by
	id;

