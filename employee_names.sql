/*
Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.

The Employee table containing employee data for a company is described as follows:
 employee_id: Integer
 name: String
 months: Integer
 salary: Integer
The Name column only contains uppercase (A-Z) and lowercase (a-z) letters.
 */

SELECT name
FROM Employee
ORDER BY name;
