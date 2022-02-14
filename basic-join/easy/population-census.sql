-- Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.
SELECT SUM(CI.POPULATION)
FROM CITY AS CI
LEFT JOIN COUNTRY AS CO
ON CO.CODE = CI.COUNTRYCODE
WHERE CO.CONTINENT = 'Asia';
