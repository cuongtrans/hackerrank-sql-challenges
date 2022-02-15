-- Write a query to output the start and end dates of projects listed by the number of days it took to complete the project in ascending order. If there is more than one project that have the same number of completion days, then order by the start date of the project.
SELECT P1.Start_Date, 
       MIN(P2.End_Date)
FROM (SELECT Start_Date
     FROM Projects
     WHERE Start_Date NOT IN (SELECT End_Date
                              FROM Projects)) AS P1,
                             (SELECT End_Date
                              FROM Projects
                              WHERE End_Date NOT IN (SELECT Start_Date
                                                     FROM Projects)) AS P2
WHERE P1.Start_Date < P2.End_Date
GROUP BY P1.Start_Date
ORDER BY (MIN(P2.End_Date) - P1.Start_Date) ASC,
         P1.Start_Date ASC;
