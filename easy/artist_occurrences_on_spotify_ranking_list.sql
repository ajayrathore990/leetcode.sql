/*
Write an SQL query to find how many times each artist appeared on the spotify ranking list.
*/

SELECT
	artist,
	count(1) AS occurrences 
FROM
	leetcode2669.Spotify 
GROUP BY
	artist 
ORDER BY
	occurrences DESC,
	artist;

