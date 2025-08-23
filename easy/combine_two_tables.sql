/*
Write a SQL query for a report that provides the following 
information for each person in the Person table, regardless 
if there is an address for each of those people

FirstName, LastName, City, State
*/

select
	p.firstname,
	p.lastname,
	a.city,
	a.state
from
	leetcode175.Person p
inner join leetcode175.Address a 
on
	p.personid = a.personid;


