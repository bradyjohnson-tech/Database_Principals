DROP FUNCTION IF EXISTS addStudent;
DELIMITER $$
    CREATE FUNCTION addStudent(in_first_name VARCHAR(50), in_last_name VARCHAR(50), in_email_address VARCHAR(100), in_date_of_birth DATE, in_student_year INT)
        RETURNS BOOL
        DETERMINISTIC
        BEGIN
            INSERT INTO SCHOOL.STUDENT(first_name, last_name, email_address, date_of_birth, student_year)
                VALUES (in_first_name,in_last_name,in_email_address,in_date_of_birth,in_student_year);
            RETURN 1;
        END $$
DELIMITER ;


DROP FUNCTION IF EXISTS getTeacherId;
DELIMITER $$
    CREATE FUNCTION getTeacherId(in_first_name VARCHAR(50), in_last_name VARCHAR(50))
        RETURNS INT
        DETERMINISTIC
        BEGIN
            DECLARE teacherID INT;
            SELECT TEACHER.teacher_id INTO teacherID FROM TEACHER WHERE teacher_first_name = in_first_name AND teacher_last_name = in_last_name;
            RETURN teacherID;
        END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS getAllStudents;
DELIMITER $$
    CREATE PROCEDURE getAllStudents()
        BEGIN
            SELECT * FROM SCHOOL.STUDENT;
        end $$
DELIMITER ;


DROP PROCEDURE IF EXISTS getTeacherStudents;
DELIMITER $$
    CREATE PROCEDURE getTeacherStudents(in_teacher_first_name VARCHAR(50), in_teacher_last_name VARCHAR(50))
        BEGIN
            SELECT ST.student_id, ST.first_name, ST.last_name
            FROM SCHOOL.ENROLLMENTS EN
                 INNER JOIN SCHOOL.STUDENT AS ST ON EN.student_id = ST.student_id
                 INNER JOIN SCHOOL.CLASSES AS CL ON EN.class_id = CL.class_id
                 INNER JOIN SCHOOL.TEACHER AS T ON CL.teacher = T.teacher_id
            WHERE T.teacher_id = (SELECT getTeacherId(in_teacher_first_name, in_teacher_last_name));
        end $$
DELIMITER ;


/* a different way to skin this cat.
DROP PROCEDURE IF EXISTS getTeacherStudents;
DELIMITER $$
CREATE PROCEDURE getTeacherStudents(in_teacher_first_name VARCHAR(50), in_teacher_last_name VARCHAR(50))
BEGIN
    SET @sp_teacher_id := getTeacherId(in_teacher_first_name, in_teacher_last_name);
    SELECT ST.student_id, ST.first_name, ST.last_name
    FROM SCHOOL.ENROLLMENTS EN
             INNER JOIN SCHOOL.STUDENT AS ST ON EN.student_id = ST.student_id
             INNER JOIN SCHOOL.CLASSES AS CL ON EN.class_id = CL.class_id
             INNER JOIN SCHOOL.TEACHER AS T ON CL.teacher = T.teacher_id
    WHERE T.teacher_id = @sp_teacher_id;
end $$
DELIMITER ;
*/


/*
SELECT addStudent('Donald', 'Trump', 'donal.trump1@school.com', '1946-06-14', 100);
SELECT getTeacherId('Tucker', 'Carlson');
call getAllStudents();
call getTeacherStudents('Tucker', 'Carlson');
*/
