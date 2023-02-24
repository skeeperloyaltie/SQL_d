-- Assumption of sql database
students(sid: string, name: string, login: string, age: integer, gpa: real)
courses(cid: string, cname: string, credits: integer, deptid: string)
enrollments(sid: string, cid: string, term: string, grade: string)

-- grade points
grade_points(grade: string, points: real)
-------------------------------------------------------------------------------------------------
-- Qn1 A
SELECT SUM(enrollments.grade_points * courses.credits) AS total_grade_points
FROM enrollments
JOIN courses ON enrollments.cid = courses.cid
WHERE enrollments.sid = '12345';

-------------------------------------------------------------------------------------------------
-- Qn1 B
SELECT SUM(enrollments.grade_points * courses.credits) / SUM(courses.credits) AS gpa
FROM enrollments
JOIN courses ON enrollments.cid = courses.cid
WHERE enrollments.sid = '12345';
------------------------------------------------------------------------------------------------

-- Qn1 C
SELECT enrollments.sid, SUM(enrollments.grade_points * courses.credits) / SUM(courses.credits) AS gpa
FROM enrollments
JOIN courses ON enrollments.cid = courses.cid
GROUP BY enrollments.sid;

-----------------------------------------------------------------------------------------------

-- Qn1 D

--Part A
-- a. If there are null grades, the grade_points function will not be able to convert those grades to numeric points, 
-- which will result in incorrect total grade points earned by the student. To handle null grades properly, 
-- we can use the COALESCE function to replace null grades with a default value before calculating the grade points. 
-- For example, we can use the following SQL query:

SELECT SUM(grade_points(COALESCE(enrollments.grade, 'F'), courses.points) * courses.credits) AS total_grade_points
FROM enrollments
JOIN courses ON enrollments.cid = courses.cid
WHERE enrollments.sid = '12345';

-- Part B

-- b. If there are null grades, the calculation of the GPA will also be affected, since the total credits 
-- for the associated courses will be incorrect if some credits are missing due to null grades. 
-- To handle null grades properly, we can use the SUM function with the CASE expression to count 
-- only non-null credits in the calculation of the total credits. 
-- For example, we can use the following SQL query:

SELECT SUM(grade_points(COALESCE(enrollments.grade, 'F'), courses.points) * 
           CASE WHEN enrollments.grade IS NOT NULL THEN courses.credits ELSE 0 END) / 
       SUM(CASE WHEN enrollments.grade IS NOT NULL THEN courses.credits ELSE 0 END) AS gpa
FROM enrollments
JOIN courses ON enrollments.cid = courses.cid
WHERE enrollments.sid = '12345';

-- Part C

-- c. If there are null grades, the calculation of the total grade points earned by each student 
-- will be affected, since null grades cannot be converted to numeric points. 
-- To handle null grades properly, we can use the COALESCE function to replace null grades with 
-- a default value before calculating the grade points, and also use the SUM function with the 
-- CASE expression to count only non-null credits in the calculation of the total credits. 
-- For example, we can use the following SQL query:

SELECT enrollments.sid, 
       SUM(grade_points(COALESCE(enrollments.grade, 'F'), courses.points) * 
           CASE WHEN enrollments.grade IS NOT NULL THEN courses.credits ELSE 0 END) / 
       SUM(CASE WHEN enrollments.grade IS NOT NULL THEN courses.credits ELSE 0 END) AS gpa
FROM enrollments
JOIN courses ON enrollments.cid = courses.cid
GROUP BY enrollments.sid;


