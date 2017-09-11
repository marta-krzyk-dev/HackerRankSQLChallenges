--Link to the challenge: https://www.hackerrank.com/challenges/draw-the-triangle-1/problem

--SQL MS Server

WITH rows AS (        -- Create a table named rows
    SELECT 20 AS n    -- Create a row with column n and value of 20 
    UNION ALL         -- Add the upper temporary table to table below
    SELECT n-1 FROM rows WHERE n>1 -- Create 19 rows with values: 19, 18, 17 ... 1
)

SELECT REPLICATE( '* ' , n )  -- Draw '* ' n times to create a triangle
FROM rows                     -- using the table rows
