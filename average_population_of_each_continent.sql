/*
Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and
their respective average city populations (CITY.Population) rounded down to the nearest integer.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

The CITY table is described as follows:
 ID: NUMBER
 NAME: VARCHAR2(17)
 COUNTRYCODE: VARCHAR2(3)
 DISTRICT: VARCHAR2(20)
 POPULATION: NUMBER
The COUNTRY table is described as follows:
 CODE: VARCHAR2(3)
 NAME: VARCHAR2(44)
 CONTINENT: VARCHAR2(13)
 REGION: VARCHAR2(25)
 SURFACEAREA: NUMBER
 INDEPYEAR: VARCHAR2(5)
 POPULATION: NUMBER
 LIFEEXPECTANCY: VARCHAR2(4)
 GNP: NUMBER
 GNPOLD: VARCHAR2(9)
 LOCALNAME: VARCHAR2(44)
 GOVERNMENTFORM: VARCHAR2(44)
 HEADOFSTATE: VARCHAR2(32)
 CAPITAL: VARCHAR2(4)
 CODE2: VARCHAR2(2)
 */

SELECT COUNTRY.Continent, FLOOR(AVG(CITY.Population))
FROM COUNTRY
JOIN CITY on COUNTRY.Code = CITY.CountryCode
GROUP BY COUNTRY.Continent;
