/*
Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.

The STATION table is described as follows:
 ID: NUMBER
 CITY: VARCHAR2(21)
 STATE: VARCHAR2(2)
 LAT_N: NUMBER
 LONG_W: NUMBER
Where LAT_N is the northern latitude and LONG_W is the western longitude.
 */

SELECT DISTINCT CITY
FROM STATION
WHERE UPPER(SUBSTR(CITY, 1, 1)) IN ("A", "E", "I", "O", "U")
