--Link to the challenge: https://www.hackerrank.com/challenges/draw-the-triangle-1/problem
--Works for SQL MS Server

--Draw a DOWN-POINTING triangle

WITH rows AS (        -- Create a table named rows
    SELECT 20 AS n    -- Create a row with column n and value of 20 
    UNION ALL         -- Add the upper temporary table to table below
    SELECT n-1 FROM rows WHERE n>1 -- Create 19 rows with values: 19, 18, 17 ... 1
)

SELECT REPLICATE( '* ' , n )  -- Draw '* ' n times to create a DOWN-POINTING triangle
FROM rows                     -- using the table rows

--Results:
--* * * * * * * * * * 
--* * * * * * * * * 
--* * * * * * * * 
--* * * * * * * 
--* * * * * * 
--* * * * * 
--* * * * 
--* * * 
--* * 
--* 

--Draw an UP-POINTING triangle
WITH rows AS (        -- Create a table named rows
    SELECT 1 AS n    -- Create a row with column n and value of 1 
    UNION ALL         -- Add the upper temporary table to table below
    SELECT n+1 FROM rows WHERE n<10 -- Create 9 rows with values: 2, 3 .. 10
)

SELECT REPLICATE( '* ' , n )  -- Draw '* ' n times to create an UP-POINTING triangle
FROM rows  

--Results:
--* 
--* * 
--* * * 
--* * * * 
--* * * * * 
--* * * * * * 
--* * * * * * * 
--* * * * * * * * 
--* * * * * * * * * 
--* * * * * * * * * * 
