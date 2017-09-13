--The problem: https://www.hackerrank.com/challenges/the-report/problem
--The query selects Name, Grade and Mark of students who received a grade of at least 8.

SELECT 
IF((SELECT Grade FROM Grades WHERE (s.Marks>=Grades.Min_mark AND s.Marks <=Grades.Max_mark))<8,NULL,s.Name),
(SELECT Grade FROM Grades WHERE (s.Marks>=Grades.Min_mark AND s.Marks <=Grades.Max_mark)) as var,
s.Marks
FROM Students AS s
ORDER BY var DESC, s.Name

--Sample output
--Britney 10 95 
--Heraldo 10 94 
--Julia 10 96 
--Kristeen 10 100 
--Stuart 10 99 
--Amina 9 89 
--Christene 9 88 
--Salma 9 81 
--Samantha 9 87 
--Scarlet 9 80 
--Vivek 9 84 
--Aamina 8 77 
--Belvet 8 78 
--Paige 8 74 
--Priya 8 76 
--Priyanka 8 77 
--NULL 7 64 
--NULL 7 66 
--NULL 6 55 
--NULL 4 34 
--NULL 3 24 
