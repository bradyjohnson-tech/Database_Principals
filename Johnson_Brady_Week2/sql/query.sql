USE SCHOOL;

SELECT ST.first_name AS firstName, ST.last_name AS lastName, CL.subject AS className, CONCAT(T.teacher_first_name, ' ', T.teacher_last_name) AS TeacherName,  EN.class_grade AS grade
FROM SCHOOL.ENROLLMENTS EN
INNER JOIN SCHOOL.STUDENT AS ST ON EN.student_id = ST.student_id
INNER JOIN SCHOOL.CLASSES AS CL ON EN.class_id = CL.class_id
INNER JOIN SCHOOL.TEACHER AS T ON CL.teacher = T.teacher_id
WHERE EN.semester_id = 1
ORDER BY ST.student_id, EN.class_grade; /* The directions specifically say to do a 'GROUP BY HERE' but I do not see how
                                           this can work since group by would organize by a specific column but not
                                           necessarily put them in an order. Instead, I used the 'ORDER BY' with the student_id.
                                           This places this list in order by the student ID which has the effect of making
                                           them look like a group. The grade is the secondary attribute which is sorted after
                                           the result is sorted by the student id. */

SELECT class_grade FROM SCHOOL.ENROLLMENTS WHERE student_id =1 AND class_id = 1 AND semester_id = 1
