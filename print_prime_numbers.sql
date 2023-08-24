/*
Write a query to print all prime numbers less than or equal to 1000.
Print your result on a single line, and use the ampersand (&) character as your separator (instead of a space).
For example, the output for all prime numbers <= 10 would be:
2&3&5&7
 */

SET SESSION group_concat_max_len = 10000;

SELECT GROUP_CONCAT(num ORDER BY num ASC SEPARATOR '&') AS primes
FROM (
    SELECT num FROM (
        SELECT a.a + 10 * b.a + 100 * c.a AS num
        FROM (SELECT 0 AS a UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
             (SELECT 0 AS a UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b,
             (SELECT 0 AS a UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) c
        HAVING num BETWEEN 2 AND 1000
    ) nums
    WHERE NOT EXISTS (
        SELECT 1
        FROM (
            SELECT ROW_NUMBER() OVER() + 1 AS x
            FROM information_schema.tables t1,
                 information_schema.tables t2
            LIMIT 1000
        ) divisors
        WHERE num % x = 0 AND x < num AND x != 1
    )
) primes;
