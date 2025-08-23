/*
Suppose that a website contains two tables, the Customers table and the Orders table. 
Write a SQL query to find all customers who never order anything.
*/

select
	c.name as Customers
from
	leetcode183.customers c
left join leetcode183.order o 
on
	c.id = o.customerid
where
	o.customerid is null;


