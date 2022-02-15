-- Write a query to output all such symmetric pairs in ascending order by the value of X. List the rows such that X1 ≤ Y1.
(SELECT X, Y
FROM
(SELECT X, Y
FROM Functions
WHERE X = Y
GROUP BY X,
         Y
HAVING COUNT(*) = 2)
UNION
(SELECT F1.X, F1.Y
FROM Functions F1, Functions F2
WHERE F1.X < F1.Y AND 
      F1.X = F2.Y AND 
      F2.X = F1.Y)
ORDER BY X ASC, 
         Y ASC);
