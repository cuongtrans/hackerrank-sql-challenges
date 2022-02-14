-- Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as 2 space-separated integers.
SELECT ROUND(MAX(months * salary), 2), 
       COUNT(months * salary) 
FROM Employee 
WHERE (months * salary) 
= (SELECT MAX(months * salary) 
   FROM Employee);
