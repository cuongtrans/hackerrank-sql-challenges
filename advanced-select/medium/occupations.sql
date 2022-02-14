-- Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.
SELECT MAX(CASE WHEN Occupation = 'Doctor' THEN Name ENDL) AS Doctor,
       MAX(CASE WHEN Occupation = 'Professor' THEN Name END) AS Professor,
       MAX(CASE WHEN Occupation = 'Singer' THEN Name END) AS Singer,
       MAX(CASE WHEN Occupation = 'Actor' THEN Name END) AS Actor
FROM (SELECT Name, 
             Occupation, 
             ROW_NUMBER() OVER(PARTITION BY Occupation ORDER BY Name ASC) AS ROW_NUMBER_BY_OCCPUATION
FROM OCCUPATIONS)
GROUP BY ROW_NUMBER_BY_OCCPUATION
ORDER BY ROW_NUMBER_BY_OCCPUATION ASC;
