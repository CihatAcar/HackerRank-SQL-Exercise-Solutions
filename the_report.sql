/*
You are given two tables: Students and Grades. Students contains three columns ID, Name and Marks.

The STUDENTS table is described as follows:
 ID: INTEGER
 NAME: STRING
 MARKS: INTEGER

The GRADES table is described as follows:
 Grade: INTEGER
 Min_Mark: INTEGER
 Max_Mark: INTEGER

Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. 
Ketty doesn't want the NAMES of those students who received a grade lower than 8. 
The report must be in descending order by grade -- i.e. higher grades are entered first. 
If there is more than one student with the same grade (8-10) assigned to them, 
order those particular students by their name alphabetically. 
Finally, if the grade is lower than 8, use "NULL" as their name 
and list them by their grades in descending order. 
If there is more than one student with the same grade (1-7) assigned to them, 
order those particular students by their marks in ascending order.

Write a query to help Eve.
 */
SELECT CASE WHEN GRADES.GRADE > 7 THEN STUDENTS.NAME ELSE STUDENTS.NAME = NULL END AS NAME, GRADES.GRADE, STUDENTS.MARKS 
FROM STUDENTS
JOIN GRADES ON STUDENTS.MARKS BETWEEN GRADES.MIN_MARK AND GRADES.MAX_MARK
ORDER BY GRADES.GRADE DESC, CASE WHEN GRADES.GRADE >= 8 THEN STUDENTS.NAME END ASC, CASE WHEN GRADES.GRADE < 8 THEN STUDENTS.MARKS END ASC;