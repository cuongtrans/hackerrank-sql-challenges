-- Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.
SELECT CO.CONTINENT, 
       FLOOR(AVG(CI.POPULATION))
FROM CITY AS CI
LEFT JOIN COUNTRY AS CO
ON CO.CODE = CI.COUNTRYCODE
GROUP BY CO.CONTINENT;
