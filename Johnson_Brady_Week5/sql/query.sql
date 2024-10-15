SELECT * FROM SCHOOL.TEACHER;
SELECT * FROM SCHOOL.SEMESTER;
SELECT * FROM SCHOOL.STUDENT;
SELECT * FROM SCHOOL.CLASSES;
SELECT * FROM SCHOOL.ENROLLMENTS;

SELECT ST.first_name, ST.last_name, CL.subject, EN.class_grade
FROM ENROLLMENTS EN
LEFT JOIN STUDENT AS ST ON EN.student_id = ST.student_id
RIGHT JOIN CLASSES AS CL ON EN.class_id = CL.class_id
WHERE ST.student_id = 1 AND EN.semester_id = 1
GROUP BY ST.student_id, CL.subject, EN.class_grade;


SELECT Count(ST.student_id) AS ClassSize, CL.subject
FROM ENROLLMENTS EN
         LEFT JOIN STUDENT AS ST ON EN.student_id = ST.student_id
         RIGHT JOIN CLASSES AS CL ON EN.class_id = CL.class_id
WHERE EN.semester_id = 1
GROUP BY CL.subject;

SELECT Count(STUDENT.student_id) AS GraduatingClassSize, student_year FROM STUDENT GROUP BY student_year;
