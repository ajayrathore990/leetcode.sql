/*
Write a solution to find the number of files that have at least one occurrence 
of the words 'bull' and 'bear' as a standalone word, respectively, 
disregarding any instances where it appears without space on 
either side (e.g. 'bullet', 'bears', 'bull.', or 'bear' at the beginning or 
end of a sentence will not be considered) 
*/

select
	'bull' as word,
	count(*) as count
from
	leetcode2738.Files
where
	content like '% bull %'
union
select
	'bear' as word,
	count(*) as count
from
	leetcode2738.Files
where
	content like '% bear %';


