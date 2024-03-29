/*
A median is defined as a number separating the higher half of a data set from the lower half.
Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places.

The STATION table is described as follows:
 ID: NUMBER
 CITY: VARCHAR2(21)
 STATE: VARCHAR2(2)
 LAT_N: NUMBER
 LONG_W: NUMBER
Where LAT_N is the northern latitude and LONG_W is the western longitude.
 */

SELECT ROUND(AVG(S.LAT_N), 4)
FROM STATION S
WHERE
    (SELECT COUNT(LAT_N) FROM STATION WHERE LAT_N >= S.LAT_N)
    =
    (SELECT COUNT(LAT_N) FROM STATION WHERE LAT_N <= S.LAT_N)
OR
    (SELECT COUNT(LAT_N) FROM STATION WHERE LAT_N > S.LAT_N)
    =
    (SELECT COUNT(LAT_N) FROM STATION WHERE LAT_N < S.LAT_N);

