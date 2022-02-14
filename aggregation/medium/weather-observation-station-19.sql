-- Query the Euclidean Distance between points P1 and P2 and format your answer to display 4 decimal digits.
SELECT ROUND(SQRT(POWER(MIN(LAT_N) - MAX(LAT_N), 2) + POWER(MAX(LONG_W) - MIN(LONG_W), 2)), 4)
FROM STATION;
