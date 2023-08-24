/*
 P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):
* * * * *
* * * *
* * *
* *
*
Write a query to print the pattern P(20).
 */
 WITH RECURSIVE NumberSeries AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1
    FROM NumberSeries
    WHERE n < 20
)

SELECT TRIM(
           CASE WHEN n = 20 THEN '*'
                ELSE CONCAT(REPEAT('* ', 20 - n), '*')
           END
       ) AS Pattern
FROM NumberSeries
ORDER BY n;
