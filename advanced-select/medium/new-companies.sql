-- write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code.
SELECT C.company_code, 
       C.founder, 
       COUNT(DISTINCT L.lead_manager_code), 
       COUNT(DISTINCT S.senior_manager_code), 
       COUNT(DISTINCT M.manager_code), 
       COUNT(DISTINCT E.employee_code)
FROM Company AS C
FULL OUTER JOIN Lead_Manager AS L
ON L.company_code = C.company_code
FULL OUTER JOIN Senior_Manager AS S
ON S.company_code = L.company_code
FULL OUTER JOIN Manager AS M
ON M.company_code = S.company_code
FULL OUTER JOIN Employee AS E
ON E.company_code = M.company_code
GROUP BY C.company_code, 
         C.founder
ORDER BY C.company_code ASC;
