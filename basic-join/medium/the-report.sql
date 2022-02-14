-- Write a query to generate a report containing three columns: Name, Grade and Mark.
SELECT CASE WHEN A.Grade >= 1 and A.Grade < 8 THEN NULL
            ELSE A.Name
            END AS Name,
       A.Grade,
       A.Marks
FROM (SELECT Name, Marks,
             CASE WHEN Marks >= 0 AND Marks <= 9 THEN 1 
             WHEN Marks >= 10 AND Marks <= 19 THEN 2
             WHEN Marks >= 20 AND Marks <= 29 THEN 3
             WHEN Marks >= 30 AND Marks <= 39 THEN 4
             WHEN Marks >= 40 AND Marks <= 59 THEN 6
             WHEN Marks >= 60 AND Marks <= 69 THEN 7
             WHEN Marks >= 70 AND Marks <= 79 THEN 8
             WHEN Marks >= 80 AND Marks <= 89 THEN 9
             ELSE 10
END AS Grade
FROM Students) AS A
ORDER BY A.Grade DESC, 
         A.Name ASC, 
         A.Marks ASC;
