-- Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge.
SELECT HACKER.hacker_id, 
       HACKER.name
FROM (SELECT H.hacker_id, 
             H.name, COUNT(*) AS TOTAL_CHALLENGES
      FROM Hackers AS H
      JOIN Submissions AS S
           ON S.hacker_id = H.hacker_id
      JOIN Challenges AS C
           ON C.challenge_id = S.challenge_id
      JOIN Difficulty AS D
           ON D.difficulty_level = C.difficulty_level
      WHERE S.score = D.score
      GROUP BY H.hacker_id, 
               H.name) AS HACKER
WHERE HACKER.total_challenges >= 2
ORDER BY HACKER.total_challenges DESC, 
         HACKER.hacker_id ASC;
