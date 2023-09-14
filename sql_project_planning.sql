/*
You are given a table, Projects, containing three columns: Task_ID, Start_Date and End_Date. 
It is guaranteed that the difference between the End_Date and the Start_Date is equal to 1 day for each row in the table.

Task_ID: Integer
Start_Date: Date
End_Date: Date

If the End_Date of the tasks are consecutive, then they are part of the same project. 
Samantha is interested in finding the total number of different projects completed.

Write a query to output the start and end dates of projects listed 
by the number of days it took to complete the project in ascending order. 
If there is more than one project that have the same number of completion days, then order by the start date of the project.

 */
SELECT MIN(Start_Date) AS Project_Start_Date, MAX(End_Date) AS Project_End_Date
FROM (
    SELECT Start_Date, End_Date, 
           Start_Date - INTERVAL (ROW_NUMBER() OVER (ORDER BY Start_Date)) DAY AS Grouping_Col
    FROM Projects
    ) AS TempTable
GROUP BY Grouping_Col
ORDER BY DATEDIFF(MAX(End_Date), MIN(Start_Date)) ASC, MIN(Start_Date) ASC;
