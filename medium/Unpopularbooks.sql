/*
Write an SQL query that reports the books that have sold less than 10 copies in the last year, 
excluding books that have been available for less than 1 month from today. 
Assume today is 2019-06-23.
*/

select
	*
from
	leetcode1098.Books
where
	available_from <= DATE '2019-06-23' + interval '30 days'
	and
book_id not in (
	select
		book_id
	from
		leetcode1098.Orders
	group by
		book_id
	having
		sum(quantity) >= 10
);

