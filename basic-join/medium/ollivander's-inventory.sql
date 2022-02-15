-- Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power. If more than one wand has same power, sort the result in order of descending age.
SELECT WS.id, 
       WPS.age,
       A.minimum_galleons_needed, 
       A.power
FROM (SELECT W.power, 
             W.code, 
             MIN(W.coins_needed) AS minimum_galleons_needed
      FROM Wands AS W
      JOIN wands_property AS WP
      ON WP.code = W.code
      WHERE WP.is_evil = 0
      GROUP BY W.power, 
               W.code) AS A
JOIN Wands AS WS
ON A.minimum_galleons_needed = WS.coins_needed
AND A.code = WS.code
AND A.power = WS.power
JOIN wands_property AS WPS
ON WPS.code = WS.code
ORDER BY A.power DESC,
         WPS.age DESC;
