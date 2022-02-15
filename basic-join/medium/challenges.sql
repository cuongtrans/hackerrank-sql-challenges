-- Write a query to print the hacker_id, name, and the total number of challenges created by each student. Sort your results by the total number of challenges in descending order. If more than one student created the same number of challenges, then sort the result by hacker_id. If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.
SELECT A.*
FROM (SELECT H.hacker_id, 
             H.name, 
             COUNT(CH.challenge_id) AS challenges_created
      FROM Hackers AS H
      JOIN Challenges AS CH
      ON CH.hacker_id = H.hacker_id
      GROUP BY H.hacker_id, 
               H.name) AS A
WHERE A.challenges_created = (SELECT MAX(C.total_number_challenges)
                              FROM (SELECT COUNT(*) OVER(PARTITION BY H1.hacker_id, 
                                                                      H1.name) AS total_number_challenges   
                                   FROM Hackers AS H1
                                   JOIN Challenges AS CH1
                                   ON CH1.hacker_id = H1.hacker_id
                                   ) AS C)
ORDER BY A.challenges_created DESC, 
         A.hacker_id ASC;
SELECT B.hacker_id, 
       B.name, 
       B.challenges_created
FROM
(SELECT A.hacker_id, 
        A.name, 
        A.challenges_created, 
        COUNT(*) OVER(PARTITION BY A.challenges_created) AS total_challenges
 FROM (SELECT H.hacker_id, 
              H.name, 
              COUNT(CH.challenge_id) AS challenges_created
       FROM Hackers AS H
       JOIN Challenges AS CH
       ON CH.hacker_id = H.hacker_id
       GROUP BY H.hacker_id, 
                H.name) AS A) AS B
WHERE B.total_challenges = 1
ORDER BY B.challenges_created DESC, 
         B.hacker_id ASC;
