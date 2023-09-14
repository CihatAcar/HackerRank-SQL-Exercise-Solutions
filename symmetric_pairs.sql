/*
You are given a table, Functions, containing two columns: X and Y both are contains integers.
Two pairs (X1, Y1) and (X2, Y2) are said to be symmetric pairs if X1 = Y2 and X2 = Y1.

Write a query to output all such symmetric pairs in ascending order by the value of X. 
List the rows such that X1 ≤ Y1. 
 */
-- Step 1: Start by selecting distinct pairs of X and Y values from the self-joined subqueries (tab1 and tab2).
SELECT DISTINCT table1.X, table1.Y 
-- Step 2: Create the first subquery named 'tab1' that selects all columns from the Functions table 
-- and also creates a new column 'rn' which is the row number assigned based on the ascending order of X values.
FROM 
    (
        SELECT *, ROW_NUMBER() OVER (ORDER BY X) AS rn 
        FROM Functions
    ) AS table1
-- Step 3: Join 'tab1' with another subquery named 'tab2' which is a copy of 'tab1', 
-- to find the symmetric pairs.
JOIN 
    (
        SELECT *, ROW_NUMBER() OVER (ORDER BY X) AS rn 
        FROM Functions
    ) AS table2 
-- Step 4: Specify the conditions for the join, where X from 'table1' equals Y from 'table2' 
-- and Y from 'table1' equals X from 'table2' and the row numbers are not equal to avoid matching rows with themselves.
ON 
    table1.X = table2.Y 
    AND table1.Y = table2.X 
    AND table1.rn <> table2.rn 
-- Step 5: Add a WHERE clause to ensure that X values are less than or equal to Y values 
-- to avoid duplicate symmetric pairs in the result.
WHERE table1.X <= table2.X;
