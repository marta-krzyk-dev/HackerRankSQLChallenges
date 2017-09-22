--Problem: https://www.hackerrank.com/challenges/weather-observation-station-2/problem
-- Select the sum of all values in LAT_N and LONG_W rounded to a scale of  decimal places.

SELECT ROUND(SUM(LAT_N),2), ROUND(SUM(LONG_W),2)
FROM STATION;

--Result
--42850.04 47381.48 

--Problem: https://www.hackerrank.com/challenges/weather-observation-station-13/problem
--Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and less than 137.2345. Truncate your answer to  decimal places.
SELECT TRUNCATE(SUM(LAT_N),4)
FROM STATION
WHERE LAT_N BETWEEN 38.7880 AND 137.2345;

--Alternatively:
SELECT TRUNCATE(SUM(LAT_N),4)
FROM STATION
WHERE LAT_N > 38.7880 AND LAT_N < 137.2345;

--Result
--36354.8135 

--Problem: https://www.hackerrank.com/challenges/weather-observation-station-3/problem
--Query a list of CITY names from STATION with even ID numbers only. City names cannot be repeated.

SELECT DISTINCT CITY 
FROM STATION
WHERE (ID % 2) = 0;
ORDER BY CITY

--Result
--Aguanga 
--Alba 
--Albany 
--Amo
--...

--Problem: https://www.hackerrank.com/challenges/weather-observation-station-4/problem
--Find the difference between the total number of CITY entries and the number of distinct CITY entries in the table.
--Works in DB2, MySQL, Oracle, MS SQL Server

SELECT COUNT(CITY) - COUNT(DISTINCT CITY)
FROM STATION;

--Problem: https://www.hackerrank.com/challenges/weather-observation-station-5/problem
--Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
--Code for DB2

SELECT CITY, LENGTH(CITY)
FROM STATION
GROUP BY CITY
ORDER BY LENGTH(CITY) ASC, CITY
FETCH FIRST 1 ROWS ONLY;

SELECT CITY, LENGTH(CITY)
FROM STATION
ORDER BY LENGTH(CITY) DESC, CITY
FETCH FIRST 1 ROWS ONLY;

--Alternatively, using WHERE and a subquery
SELECT CITY, LENGTH(CITY)
FROM STATION
WHERE LENGTH(CITY) = (SELECT MIN(LENGTH(CITY)) FROM STATION)
ORDER BY CITY
FETCH FIRST 1 ROWS ONLY;

SELECT CITY, LENGTH(CITY)
FROM STATION
WHERE LENGTH(CITY) = (SELECT MAX(LENGTH(CITY)) FROM STATION)
ORDER BY LENGTH(CITY) DESC, CITY
FETCH FIRST 1 ROWS ONLY;

--Code for MySQL
SELECT CITY, LENGTH(CITY)
FROM STATION
ORDER BY LENGTH(CITY) ASC, CITY
LIMIT 1;

SELECT CITY, LENGTH(CITY)
FROM STATION
ORDER BY LENGTH(CITY) DESC, CITY
LIMIT 1;

--Code for Oracle
SELECT * FROM
    (SELECT CITY, LENGTH(CITY)
    FROM STATION
    ORDER BY LENGTH(CITY) ASC, CITY)
WHERE ROWNUM = 1;

SELECT * FROM 
    (SELECT CITY, LENGTH(CITY)
    FROM STATION
    ORDER BY LENGTH(CITY) DESC, CITY)
WHERE ROWNUM = 1;

--Code for MS SQL Server
SELECT TOP 1 CITY, LEN(CITY)
FROM STATION
ORDER BY LEN(CITY) ASC, CITY;

SELECT TOP 1  CITY, LEN(CITY)
FROM STATION
ORDER BY LEN(CITY) DESC, CITY;

--Result
--Amo 3 
--Marine On Saint Croix 21 
