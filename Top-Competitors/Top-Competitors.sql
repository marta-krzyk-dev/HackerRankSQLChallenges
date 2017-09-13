/*The query prints the respective hacker_id and name of hackers who achieved full scores for more than one challenge. The output is in descending order by the total number of challenges in which the hacker earned a full score. If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.*/

SELECT DISTINCT h.hacker_id, h.name
FROM
Challenges as c INNER JOIN Difficulty as d 
	USING (difficulty_level) /*Create a table with challenges matching theit difficulty level*/
INNER JOIN Submissions as s 
	USING(challenge_id,score) /*Choose only the submissions with the maximum score for the challenge*/
INNER JOIN Hackers as h 
	ON h.hacker_id=s.hacker_id /*Match each submission with a hacker*/
GROUP BY h.hacker_id, h.name
HAVING count(s.hacker_id) > 1 /*Choose only the hackers who have at least 2 submissions*/
ORDER BY 
	COUNT(s.hacker_id) DESC, /*Put the hackers with the biggest number of submissions at the begging of the list*/
	h.hacker_id ASC;
