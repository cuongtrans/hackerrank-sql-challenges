-- Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score. If more than one hacker achieved the same total score, then sort the result by ascending hacker_id. Exclude all hackers with a total score of 0 from your result.
WITH max_score_challenges AS
(SELECT H.hacker_id, 
        S.challenge_id, 
        MAX(S.score) AS max_score
FROM Hackers AS H
JOIN Submissions AS S
ON H.hacker_id = S.hacker_id
GROUP BY H.hacker_id, 
         S.challenge_id)
SELECT H1.hacker_id, 
       H1.name, 
       SUM(M.max_score) AS total_score 
FROM Hackers AS H1
JOIN max_score_challenges AS M
ON M.hacker_id = H1.hacker_id
GROUP BY H1.hacker_id, 
         H1.name
HAVING SUM(M.max_score) <> 0
ORDER BY SUM(M.max_score) DESC, 
         H1.hacker_id ASC;
