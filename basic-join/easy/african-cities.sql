-- Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.
SELECT CI.NAME
FROM CITY AS CI
LEFT JOIN COUNTRY AS CO
ON CO.CODE = CI.COUNTRYCODE
WHERE CO.CONTINENT = 'African';
