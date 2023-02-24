---------------------------------------------------
-- Qn2 A
SELECT ID,
       CASE 
           WHEN score < 40 THEN 'F'
           WHEN score < 60 THEN 'C'
           WHEN score < 80 THEN 'B'
           ELSE 'A'
       END AS grade
FROM marks;


-------------------------------------------------------
-- Qn2 B
SELECT grade, COUNT(*) AS num_students
FROM (
    SELECT ID,
           CASE 
               WHEN score < 40 THEN 'F'
               WHEN score < 60 THEN 'C'
               WHEN score < 80 THEN 'B'
               ELSE 'A'
           END AS grade
    FROM marks
) AS grades
GROUP BY grade;
