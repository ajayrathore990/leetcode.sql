/*
Write an SQL query to report, 
How much cubic feet of volume does the inventory occupy in each warehouse.
*/

select
	w.name as warehouse_name,
	sum(w.units * p.width * p.length * p.height) as volume
from
	leetcode1571.Products p
left join leetcode1571.Warehouse w
on
	p.product_id = w.product_id
group by
	w.name
order by
	sum(w.units * p.width * p.length * p.height) desc;

