/*
Consider P1(a,b) and P2(c,d) to be two points on a 2D plane.
a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
d happens to equal the maximum value in Western Longitude (LONG_W in STATION).
Query the Manhattan Distance between points P1 and P2 and round it to a scale of 4 decimal places.

The STATION table is described as follows:
 ID: NUMBER
 CITY: VARCHAR2(21)
 STATE: VARCHAR2(2)
 LAT_N: NUMBER
 LONG_W: NUMBER
Where LAT_N is the northern latitude and LONG_W is the western longitude.

The Manhattan distance between two points P1(x1, y1) and P2(x2, y2) in a 2D plane is calculated as:

Manhattan Distance = |x2 − x1| + |y2 − y1|

Given the exercise conditions, we can use this formula to calculate the Manhattan distance between points P1 and P2:

Manhattan Distance = |c − a| + |d − b|
a = MIN(LAT_N)
b = MIN(LONG_W)
c = MAX(LAT_N)
d = MAX(LONG_W)
 */

SELECT ROUND((MAX(LAT_N) - MIN(LAT_N)) + (MAX(LONG_W) - MIN(LONG_W)), 4)
FROM STATION;
