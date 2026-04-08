Academic Performance Comparison
○ Compared average final grades (G3) of both schools.
○ Insight: GP students showed slightly better academic performance.

SELECT  avg(g3) as avg_score
FROM students_gp as sg
JOIN students_ms as sm
ON sg.student_id = sm.student_id;


select avg(g3) as avg_score
from all_students
group by school


SELECT school, AVG(G3) AS avg_score
FROM (
    SELECT 'GP' AS school, G3 FROM students_gp
    UNION ALL
    SELECT 'MS' AS school, G3 FROM students_ms
) AS all_students
GROUP BY school;


Alcohol Consumption Impact 
○ Grouped students by combined alcohol consumption (DALC + WALC) into Low, 
Medium, High.
○ Insight: Higher alcohol consumption was associated with lower grades, 
especially in MS. 

SELECT 
CASE 
    WHEN (dalc + walc) <= 2 THEN 'Low'
    WHEN (dalc + walc) BETWEEN 3 AND 6 THEN 'Medium'
    ELSE 'High'
END AS alcohol_level,
COUNT(*) AS total_students
FROM all_students
GROUP BY alcohol_level;
  
 SELECT CASE 
    WHEN (dalc + walc) <= 2 THEN 'Low'
    WHEN (dalc + walc) BETWEEN 3 AND 6 THEN 'Medium'
    ELSE 'High'
END AS alcohol_level,
AVG(G3) AS avg_grade
FROM (
    SELECT 'GP' AS school, dalc, walc, G3
    FROM students_gp
    UNION ALL
    SELECT 'MS' AS school, dalc, walc, G3 
    FROM students_ms
) AS all_students
GROUP BY school, alcohol_level;

 2.Study-Time Effectiveness 
○ Compared grades across different study time categories.
Insight: Higher study time correlated with better grades in both schools. 

select avg(g3) as avg_score, studytime
from
(select studytime, G3
FROM students_gp
union all 
select studytime,G3
from students_ms 
) as all_student
group by studytime


SELECT 
school,
studytime,
AVG(G3) AS avg_grade
FROM (
    SELECT 'GP' AS school, studytime, G3 FROM students_gp
    UNION ALL
    SELECT 'MS' AS school, studytime, G3 FROM students_ms
) AS all_students
GROUP BY school, studytime
ORDER BY avg_grade, studytime;

4.family Support Impact 
○ Analyzed the effect of famsup on final grades.
○ Insight: No major grade difference observed with or without family support. 

select avg(G3) as avg_score , famsup 
from(
select famsup ,G3 from students_gp
union all
select famsup , G3 from students_ms) as all_student
group by famsup

Absenteeism Patterns 
Evaluated average absences and final grades. 
Insight: GP students had more absences but still scored higher on average

select avg(absences) as avg_absences, AVG(G3),SCHOOL
 From( select G3 ,absences ,"MS" AS SCHOOL from students_ms 
       union all
       select G3 ,absences ,"GP" AS SCHOOL from students_gp) as total_students
       GROUP BY SCHOOL
       
 Urban vs Rural Performance 
Compared student performance based on address (Urban vs Rural).
Insight: Minor differences observed; both urban and rural students performed 
similarly.
SELECT 
address,
AVG(G3) AS avg_grade
FROM (
    SELECT address, G3 FROM students_gp
    UNION ALL
    SELECT address, G3 FROM students_ms
) AS all_students
GROUP BY address;


Extracurricular Activities Impact 
Compared grades of students with and without activities. 
○Insight: Active students generally had better grades.

 SELECT 
activities,
AVG(G3) AS avg_grade
FROM (
    SELECT activities, G3 FROM students_gp
    UNION ALL
    SELECT activities, G3 FROM students_ms
) AS all_students
GROUP BY activities;