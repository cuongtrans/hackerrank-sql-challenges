-- Write a query to print the pattern P(20).
SET @number = 21;
SELECT REPEAT('* ', @number := @number - 1) 
FROM INFORMATION_SCHEMA.TABLES
LIMIT 20;
