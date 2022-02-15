-- Write a query to print all prime numbers less than or equal to 1000. Print your result on a single line, and use the ampersand (&) character as your separator (instead of a space).
SELECT GROUP_CONCAT(NUMBER_1 SEPARATOR '&')
FROM (SELECT @num:= @num + 1 AS NUMBER_1 
      FROM INFORMATION_SCHEMA.TABLES AS T1,
           INFORMATION_SCHEMA.TABLES AS T2,
           (SELECT @num:= 1))
WHERE NUMBER_1 <= 1000 AND NOT EXISTS(SELECT * 
                                      FROM (SELECT @nu:= @nu + 1 AS NUMBER_2 
                                            FROM INFORMATION_SCHEMA.TABLES T1,
                                                 INFORMATION_SCHEMA.TABLES t2,
                                                 (SELECT @nu:= 1)
                                            LIMIT 1000)
                                       WHERE FLOOR(NUMB/ NUMA) = (NUMB/ NUMA) AND NUMA < NUMB AND NUMA > 1)
