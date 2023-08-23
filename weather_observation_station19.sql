/*
Consider P1(a,c) and P2(b,d) to be two points on a 2D plane.
Where (a,b) are the respective minimum and maximum values of Northern Latitude (LAT_N) and
      (c,d) are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.
Query the Euclidean Distance between points P1 and P2 and format your answer to display 4 decimal digits.

The STATION table is described as follows:
 ID: NUMBER
 CITY: VARCHAR2(21)
 STATE: VARCHAR2(2)
 LAT_N: NUMBER
 LONG_W: NUMBER
Where LAT_N is the northern latitude and LONG_W is the western longitude.

The Euclidean distance between two points P1(x1, y1) and P2(x2, y2) in a 2D plane is calculated as:

Euclidian Distance = Square root of ((x2 - x1)^2 + (y2 - y1)^2)

Given the exercise conditions, we can use this formula to calculate the Euclidian distance between points P1 and P2:

Euclidian Distance = Square root of ((b - a)^2 + (d - c)^2)
a = MIN(LAT_N)
b = MAX(LAT_N)
c = MIN(LONG_W)
d = MAX(LONG_W)
 */

SELECT ROUND(SQRT(POW(MAX(LAT_N) - MIN(LAT_N), 2) + POW((MAX(LONG_W) - MIN(LONG_W)), 2)), 4) AS euclidian_distance
FROM STATION;
