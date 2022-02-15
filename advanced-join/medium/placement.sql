-- Write a query to output the names of those students whose best friends got offered a higher salary than them. Names must be ordered by the salary amount offered to the best friends. It is guaranteed that no two students got same salary offer.
WITH Salary_Table AS
(SELECT S.ID, 
        S.Name, 
        F.Friend_ID, 
        P.Salary
FROM Students AS S
JOIN Friends AS F
ON F.ID = S.ID
JOIN Packages AS P
ON P.ID = F.Friend_ID),
Friend_Salary_Table AS
(SELECT S1.ID, 
        S1.Name, 
        S1.Friend_ID, 
        S1.Salary,
        CASE WHEN (S1.ID = S2.Friend_ID) AND (S1.Friend_ID <> S2.ID) OR (S1.ID = S2.Friend_ID) AND (S1.Friend_ID = S2.ID) THEN S2.Salary
        ELSE NULL
        END AS Friend_Salary
FROM Salary_Table AS S1, Salary_Table AS S2)
SELECT Name
FROM Friend_Salary_Table
WHERE Friend_Salary IS NOT NULL
AND Friend_Salary < Salary
ORDER BY Salary ASC;
