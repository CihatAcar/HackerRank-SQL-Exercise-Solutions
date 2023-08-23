/*
Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.GIT

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
WHERE
    UPPER(SUBSTR(CITY, 1, 1)) NOT IN ("A", "E", "I", "O", "U")
  AND
    UPPER(SUBSTR(CITY, -1, 1)) NOT IN ("A", "E", "I", "O", "U")
