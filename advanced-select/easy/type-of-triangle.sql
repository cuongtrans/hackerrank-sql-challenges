-- Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:
-- + Equilateral: It's a triangle with 3 sides of equal length.
-- + Isosceles: It's a triangle with 2 sides of equal length.
-- + Scalene: It's a triangle with 3 sides of differing lengths.
-- + Not A Triangle: The given values of A, B, and C don't form a triangle.
SELECT
CASE WHEN (A = B and B = C) AND (A + B > C AND B + C > A AND A + C> B) THEN 'Equilateral'
     WHEN (A = B OR A = C OR B = C) AND (A + B > C AND B + C > A AND A + C> B) THEN 'Isosceles'
     WHEN (A <> B AND B <> C and A <> C) AND (A + B > C AND B + C > A AND A + C> B) THEN 'Scalene'
     ELSE 'Not A Triangle'
     END
FROM TRIANGLES;
