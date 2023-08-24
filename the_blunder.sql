/*
Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table,
but did not realize her keyboard's 0 key was broken until after completing the calculation.
She wants your help finding the difference between her miscalculation (using salaries with any zeros removed),
and the actual average salary.

Write a query calculating the amount of error (i.e.: actual - miscalculated average monthly salaries),
and round it up to the next integer.

The EMPLOYEES table is described as follows:
 ID: NUMBER
 NAME: STRING
 SALARY: NUMBER
 */

SELECT
    CEIL(
        AVG(SALARY) - AVG(CONVERT(REPLACE(CONVERT(SALARY, CHAR), '0', ''), SIGNED))
    ) AS Error
FROM EMPLOYEES;
