/*
You are given three tables: Students, Friends and Packages. Students contains two columns: ID and Name. 
Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend). 
Packages contains two columns: ID and Salary (offered salary in $ thousands per month).

Write a query to output the names of those students whose best friends got offered a higher salary than them. 
Names must be ordered by the salary amount offered to the best friends. 
It is guaranteed that no two students got same salary offer.
 */
SELECT student.Name
FROM Students student
JOIN Friends ON student.ID = Friends.ID
JOIN Packages studentPackages ON student.ID = studentPackages.ID
JOIN Students friend ON Friends.Friend_ID = friend.ID
JOIN Packages friendPackages ON friend.ID = friendPackages.ID
WHERE friendPackages.Salary > studentPackages.Salary
ORDER BY friendPackages.Salary ASC;
