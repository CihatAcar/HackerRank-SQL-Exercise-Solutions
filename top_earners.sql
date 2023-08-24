/*
We define an employee's total earnings to be their monthly salary * months worked,
and the maximum total earnings to be the maximum total earnings for any employee in the Employee table.

Write a query to find the maximum total earnings for all employees
as well as the total number of employees who have maximum total earnings.
Then print these values as 2 space-separated integers.


The Employee table is described as follows:
 employee_id: Integer
 name: String
 months: Integer
 salary: Integer
 */

SELECT
    MAX(salary * months) AS max_earnings,
    SUM(CASE WHEN salary * months = (SELECT MAX(salary * months) FROM Employee) THEN 1 ELSE 0 END) AS number_of_employees
FROM Employee;
